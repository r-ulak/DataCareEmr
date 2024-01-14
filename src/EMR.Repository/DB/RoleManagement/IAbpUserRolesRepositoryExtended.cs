using System.Threading.Tasks;
using EMR.Entities;
using System.Collections.Generic;
using EMR.DTO.RoleUser;

namespace EMR.DAL
{
    public interface IAbpUserRolesRepositoryExtended : IAbpUserRolesRepository
    {
        Task DeleteAbpUserRole(AbpUserRoles role, int tenantId);
        Task<List<AbpRoles>> GetRolesByUserId(UserRoleInputDto input);


    }
}

