using Abp.Dependency;
using EMR.DAL;
using EMR.Entities;
using System.Threading.Tasks;
namespace EMR.Manager.Service
{
    public class PatientVitalManager : IPatientVitalManager, ISingletonDependency
    {
        private readonly IPatientVitalRepositoryExtended _patientVitalRepositoryExtended;
        public PatientVitalManager(IPatientVitalRepositoryExtended patientVitalRepositoryExtended)
        {
            _patientVitalRepositoryExtended = patientVitalRepositoryExtended;
        }

        public async Task CreatePatientVitalAsync(PatientVital model)
        {
            await _patientVitalRepositoryExtended.InsertAsync(model);
        }
    }
}
