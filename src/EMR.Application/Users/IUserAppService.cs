using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using EMR.Users.Dto;
using EMR.Roles.Dto;
using System.Collections.Generic;
using EMR.DTO.RoleUser;

namespace EMR.Users
{
    public interface IUserAppService : IApplicationService
    {
        Task ProhibitPermission(ProhibitPermissionInput input);

        Task RemoveFromRole(long userId, string roleName);

        Task<ListResultDto<UserListDto>> GetUsers();

        Task<User> GetUserAsync(long userId);
        Task VerifyEmail(User abpUser);

    }
}