using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for OutcomeCode
    /// </summary>
    public class OutcomeCodeRepositoryExtended : OutcomeCodeRepository, IOutcomeCodeRepositoryExtended, ISingletonDependency
{
public OutcomeCodeRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
 {
 }

 }
}
