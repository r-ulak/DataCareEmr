using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.Entities;
using EMR.Roles.Dto;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for AbpRoles
    /// </summary>
    public class AbpRolesRepositoryExtended : AbpRolesRepository, IAbpRolesRepositoryExtended, ISingletonDependency
    {
        public AbpRolesRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<AbpRoles>> GetRolesByPermission(PermissionFilterInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<AbpRoles>("GetRolesByPermission", new
            {
                TenantId = input.TenantId,
                FilteredPermissionName = input.FilteredPermissionName
            })) ?? new List<AbpRoles>();
            return result.ToList();
        }
    }
}
