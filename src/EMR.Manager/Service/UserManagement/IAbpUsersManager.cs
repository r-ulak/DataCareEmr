using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.Roles.Dto;
using EMR.Users.Dto;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface IAbpUsersManager
    {
        Task<List<UserResultDto>> GetAllUsersAsync(int tenantId);
        Task<List<UserRoleResultDto>> GetAllUsersWithRoleAsync(int tenantId);
        Task<List<UserResultDto>> GetUsersByRoleIdAsync(RoleFilterInputDto input);
        Task CreateAsync(CreateUserInput input);
        Task<AbpUsers> GetUserByEmailAsync(int tenantId, string email);
        Task<UserResultDto> GetUserByIdAsync(int tenantId, long userId);
        Task<AbpUsers> GetAbpUserByIdAsync(int tenantId, long userId);
        Task UpdateUserAsync(EditUserInput input);

    }
}
