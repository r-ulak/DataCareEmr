using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IPrescriptionManager
    {
        Task<long> CreatePrescriptionAsync(PrescriptionCreateDto input);
        Task<IEnumerable<PrescriptionResultDto>> GetPrescriptionDetailAsync(PatientDataInputDto input);
        Task<IEnumerable<PrescriptionTimeLineResultDto>> GetPrescriptionTimeLineAsync(PatientDataInputDto input);
        Task UpdatePrescriptionAsync(PrescriptionUpdateDto input);
        Task<List<PrescriptionResultDto>> GetPrescriptionDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}
