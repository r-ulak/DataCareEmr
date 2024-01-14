using EMR.Entities;
using EMR.Roles.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EMR.DAL
{
    public interface IAbpRolesRepositoryExtended : IAbpRolesRepository
    {
        Task<List<AbpRoles>> GetRolesByPermission(PermissionFilterInputDto input);

    }
}

