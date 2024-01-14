using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IPrescriptionRepositoryExtended : IPrescriptionRepository
    {
        Task<List<PrescriptionResultDto>> GetPrescriptionDetailByPidAsync(PatientDataInputDto input);
        Task<List<PrescriptionResultDto>> GetPrescriptionTimeLineByPidAsync(PatientDataInputDto input);
        Task<List<PrescriptionResultDto>> GetPrescriptionDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}
