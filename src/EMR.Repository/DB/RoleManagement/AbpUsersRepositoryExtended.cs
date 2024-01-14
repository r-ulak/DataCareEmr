using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.Roles.Dto;
using EMR.Entities;
using System.Linq;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for AbpUsers
    /// </summary>
    public class AbpUsersRepositoryExtended : AbpUsersRepository, IAbpUsersRepositoryExtended, ISingletonDependency
    {
        public AbpUsersRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

        public async Task<List<UserRoleResultDto>> GetAllUsersWithRoleAsync(int tenantId)
        {
            var result = (await _procExecutor.ExecuteProcAsync<UserRoleResultDto>("GetAllUserAndRole", new
            {
                TenantId = tenantId
            })) ?? new List<UserRoleResultDto>();
            return result.ToList();
        }

        public async Task<List<AbpUsers>> GetUsersByRoleIdAsync(RoleFilterInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<AbpUsers>("GetUserByRole", new
            {
                TenantId = input.SessionInfo.TenantId,
                FilteredRoleId = input.FilteredRoleId
            })) ?? new List<AbpUsers>();
            return result.ToList();
        }
    }
}
