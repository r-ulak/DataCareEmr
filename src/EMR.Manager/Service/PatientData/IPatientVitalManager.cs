using EMR.Entities;
using System.Threading.Tasks;

namespace EMR.Manager.Service
{
    public interface IPatientVitalManager
    {
        Task CreatePatientVitalAsync(PatientVital model);
    }
}
