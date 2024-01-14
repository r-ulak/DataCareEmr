using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using Abp.Authorization;
using Abp.AutoMapper;
using Abp.Domain.Repositories;
using EMR.Authorization;
using EMR.Roles.Dto;
using EMR.Users.Dto;
using Microsoft.AspNet.Identity;
using Abp.Authorization.Users;
using EMR.Manager.Service;
using EMR.DTO.Common;
using System.Linq;
using Abp.UI;
using EMR.DTO.RoleUser;

namespace EMR.Users
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class UserAppService : EMRAppServiceBase, IUserAppService
    {
        private readonly IRepository<User, long> _userRepository;
        private readonly IPermissionManager _permissionManager;

        public UserAppService(IRepository<User, long> userRepository, IPermissionManager permissionManager)
        {
            _userRepository = userRepository;
            _permissionManager = permissionManager;
        }

        public async Task ProhibitPermission(ProhibitPermissionInput input)
        {
            var user = await UserManager.GetUserByIdAsync(input.UserId);
            var permission = _permissionManager.GetPermission(input.PermissionName);

            await UserManager.ProhibitPermissionAsync(user, permission);
        }

        //Example for primitive method parameters.
        public async Task RemoveFromRole(long userId, string roleName)
        {
            CheckErrors(await UserManager.RemoveFromRoleAsync(userId, roleName));
        }

        public async Task<ListResultDto<UserListDto>> GetUsers()
        {
            var users = await _userRepository.GetAllListAsync();

            return new ListResultDto<UserListDto>(
                users.MapTo<List<UserListDto>>()
                );
        }

        public async Task<User> GetUserAsync(long userId)
        {
            return await
                   _userRepository.GetAsync(userId)
               ;
        }

        public async Task VerifyEmail(User abpUser)
        {
            abpUser.IsEmailConfirmed = true;
            await _userRepository.UpdateAsync(abpUser);
        }

    }
}