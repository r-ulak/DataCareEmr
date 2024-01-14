using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Roles.Dto;
using EMR.Users.Dto;
using Microsoft.AspNet.Identity;
using EMR.Manager.Service;
using EMR.DTO.Common;
using Abp.UI;
using EMR.DTO.RoleUser;
using System.Linq;
using EMR.Entities;
using System;
using Abp.AutoMapper;
using Abp.Timing;

namespace EMR.Users
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class UserAccountAppService : EMRAppServiceBase, IUserAccountAppService
    {
        private readonly IAbpUsersManager _abpUserManager;
        private readonly IAbpRolesManager _abprolesManager;

        public UserAccountAppService(IAbpUsersManager abpUserManager, IAbpRolesManager abprolesManager)
        {
            _abpUserManager = abpUserManager;
            _abprolesManager = abprolesManager;
        }

        public async Task CreateUser(CreateUserInput input)
        {
            var sessionDto = new SessionDto()
            {
                TenantId = GetTenantId(),
                LoggedUserId = GetLoggedUserId()
            };
            input.SessionInfo = sessionDto;
            input.Password = new PasswordHasher().HashPassword(input.Password);
            await _abpUserManager.CreateAsync(input);

            var createdUser = await _abpUserManager
                  .GetUserByEmailAsync(input.SessionInfo.TenantId, input.EmailAddress);

            if (createdUser != null && input.Roles != null)
            {
                foreach (var item in input.Roles)
                {
                    await _abprolesManager.CreateRoleAddedAsync
                                    (new AddRoleInputDto()
                                    {
                                        RoleId = item,
                                        IsGranted = true
                                    }, createdUser.Id, sessionDto);
                }
            }
            else
            {
                throw new UserFriendlyException("Not able to assign roles");
            }
        }

        public async Task<List<UserResultDto>> GetUsersByRoleId(RoleFilterInputDto input)
        {
            input.SessionInfo = new SessionDto()
            {
                TenantId = GetTenantId()
            };
            return await
            _abpUserManager.GetUsersByRoleIdAsync(input);
        }

        public async Task<List<UserResultDto>> GetAllUsers()
        {
            return await
           _abpUserManager.GetAllUsersAsync(GetTenantId());
        }

        public async Task<List<RoleResultDto>> GetRoleByUserId(UserRoleInputDto input)
        {
            input.SessionInfo = new SessionDto()
            {
                TenantId = GetTenantId()
            };
            return await _abprolesManager.GetRoleByUserIdAsync(input);
        }

        public async Task<UserResultDto> GetUserById(long userId)
        {
            return await
            _abpUserManager.GetUserByIdAsync(GetTenantId(), userId);
        }

        public async Task UpdateUser(EditUserInput input)
        {
            var sessionDto = new SessionDto()
            {
                TenantId = GetTenantId(),
                LoggedUserId = GetLoggedUserId()
            };
            input.SessionInfo = sessionDto;
            if (!string.IsNullOrEmpty(input.Password))
            {
                input.Password = new PasswordHasher().HashPassword(input.Password);
            }
            await
               _abpUserManager.UpdateUserAsync(input);
        }

        public async Task<List<UserRoleResultDto>> GetAllUsersWithRole()
        {
            return await
             _abpUserManager.GetAllUsersWithRoleAsync(GetTenantId());
        }
    }
}