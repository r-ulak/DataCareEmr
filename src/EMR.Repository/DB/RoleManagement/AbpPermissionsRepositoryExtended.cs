using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;

namespace EMR.DAL
{
	/// <summary>
	/// Repository methods for AbpPermissions
	/// </summary>
public class AbpPermissionsRepositoryExtended : AbpPermissionsRepository, IAbpPermissionsRepositoryExtended, ISingletonDependency
{
public AbpPermissionsRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
{
}
}
}
