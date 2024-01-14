using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Roles.Dto;
using EMR.Entities;

namespace EMR.DAL
{
    public interface IAbpUsersRepositoryExtended : IAbpUsersRepository
    {
        Task<List<AbpUsers>> GetUsersByRoleIdAsync(RoleFilterInputDto input);
        Task<List<UserRoleResultDto>> GetAllUsersWithRoleAsync(int tenantId);

    }
}

