using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for AbpTenants
    /// </summary>
    public class AbpTenantsRepositoryExtended : AbpTenantsRepository, IAbpTenantsRepositoryExtended, ISingletonDependency
    {
        public AbpTenantsRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
    }
}
