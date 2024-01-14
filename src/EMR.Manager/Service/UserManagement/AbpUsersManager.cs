using Abp.AutoMapper;
using Abp.Dependency;
using EMR.DAL;
using EMR.Roles.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;
using EMR.Users.Dto;
using EMR.Entities;
using Abp.UI;
using Abp.Timing;
using System.Linq;
using EMR.DTO.RoleUser;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for AbpUsers
    /// </summary>
    public class AbpUsersManager : IAbpUsersManager, ISingletonDependency
    {
        private readonly IAbpUsersRepositoryExtended _abpusersRepositoryExtended;
        private readonly IAbpRolesManager _abpRolesManager;
        public AbpUsersManager(IAbpUsersRepositoryExtended abpusersRepositoryExtended,
       IAbpRolesManager abpRolesManager
            )
        {
            _abpusersRepositoryExtended = abpusersRepositoryExtended;
            _abpRolesManager = abpRolesManager;
        }
        public async Task<List<UserResultDto>> GetAllUsersAsync(int tenantId)
        {
            return (await _abpusersRepositoryExtended.GetAllAsync(tenantId))
                      .MapTo<List<UserResultDto>>();
        }

        public async Task<List<UserResultDto>> GetUsersByRoleIdAsync(RoleFilterInputDto input)
        {
            return (await _abpusersRepositoryExtended.GetUsersByRoleIdAsync(input))
                  .MapTo<List<UserResultDto>>();
        }
        public async Task<AbpUsers> GetUserByEmailAsync(int tenantId, string email)
        {
            return
               (await _abpusersRepositoryExtended.GetByEmailAddressAsync(email,
                tenantId)).FirstOrDefault();
        }
        public async Task CreateAsync(CreateUserInput input)
        {
            var user = input.MapTo<AbpUsers>();
            user.IsEmailConfirmed = false;
            var dupeEmail = await _abpusersRepositoryExtended.GetByEmailAddressAsync(input.EmailAddress,
                input.SessionInfo.TenantId);
            if (dupeEmail.Count != 0)
            {
                throw new UserFriendlyException("Email already registered");
            }

            var dupeUserName = await _abpusersRepositoryExtended.GetByUserNameAsync(input.UserName,
                input.SessionInfo.TenantId);
            if (dupeUserName.Count != 0)
            {
                throw new UserFriendlyException("Username already registered");
            }
            user.CreationTime = Clock.Now;
            user.CreatorUserId = input.SessionInfo.LoggedUserId;
            user.TenantId = input.SessionInfo.TenantId;
            await _abpusersRepositoryExtended.InsertAsync
               (user);
        }

        public async Task<UserResultDto> GetUserByIdAsync(int tenantId, long userId)
        {
            return (await GetAbpUserByIdAsync(tenantId, userId))
                .MapTo<UserResultDto>();
        }

        public async Task<AbpUsers> GetAbpUserByIdAsync(int tenantId, long userId)
        {
            return (await _abpusersRepositoryExtended
                .GetByIdAsync(userId, tenantId));
        }

        public async Task UpdateUserAsync(EditUserInput input)
        {

            var currentuser = await
            GetAbpUserByIdAsync(input.SessionInfo.TenantId, input.UserId);

            currentuser.Name = input.Name;
            currentuser.Surname = input.Surname;
            currentuser.IsActive = input.IsActive;
            currentuser.TenantId = input.SessionInfo.TenantId;
            currentuser.LastModificationTime = Clock.Now;
            currentuser.LastModifierUserId = input.SessionInfo.LoggedUserId;
            if (!string.IsNullOrEmpty(input.Password))
            {
                currentuser.Password = input.Password;
            }
            await _abpRolesManager.AddRemoveRolesForUserAsync(input);
            await _abpusersRepositoryExtended.UpdateAsync(currentuser);
        }

        public async Task<List<UserRoleResultDto>> GetAllUsersWithRoleAsync(int tenantId)
        {
            return await _abpusersRepositoryExtended.GetAllUsersWithRoleAsync(tenantId);
        }
    }
}
