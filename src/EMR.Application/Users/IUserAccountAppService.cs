using System.Threading.Tasks;
using Abp.Application.Services;
using EMR.Roles.Dto;
using System.Collections.Generic;
using EMR.DTO.RoleUser;
using EMR.Users.Dto;
using EMR.Entities;

namespace EMR.Users
{
    public interface IUserAccountAppService : IApplicationService
    {
        Task<List<UserResultDto>> GetUsersByRoleId(RoleFilterInputDto input);
        Task<List<UserResultDto>> GetAllUsers();
        Task<List<UserRoleResultDto>> GetAllUsersWithRole();
        Task<List<RoleResultDto>> GetRoleByUserId(UserRoleInputDto input);
        Task CreateUser(CreateUserInput input);
        Task<UserResultDto> GetUserById(long userId);
        Task UpdateUser(EditUserInput input);

    }
}