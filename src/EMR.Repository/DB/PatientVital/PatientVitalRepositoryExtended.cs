using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;

namespace EMR.DAL
{
    public class PatientVitalRepositoryExtended : PatientVitalRepository, IPatientVitalRepositoryExtended, ISingletonDependency
    {
        public PatientVitalRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
    }
}
