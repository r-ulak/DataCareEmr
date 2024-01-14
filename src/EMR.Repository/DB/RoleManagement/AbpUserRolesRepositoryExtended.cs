using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.Entities;
using System.Threading.Tasks;
using EMR.DTO.RoleUser;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for AbpUserRoles
    /// </summary>
    public class AbpUserRolesRepositoryExtended : AbpUserRolesRepository, IAbpUserRolesRepositoryExtended, ISingletonDependency
    {
        public AbpUserRolesRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

        public async Task DeleteAbpUserRole(AbpUserRoles role, int tenantId)
        {
            await _procExecutor.ExecuteAsync("DeleteAbpUserRole", new
            {
                TenantId = tenantId,
                AbpUserRoleId = role.Id
            });
        }



        public async Task<List<AbpRoles>> GetRolesByUserId(UserRoleInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<AbpRoles>("GetRoleByUserId", new
            {
                TenantId = input.SessionInfo.TenantId,
                UserId = input.UserId
            })) ?? new List<AbpRoles>();

            return result.ToList();
        }
    }
}
