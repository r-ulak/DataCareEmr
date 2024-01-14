using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IDiagnosisManager
    {
        Task<long> CreateDiagnosisAsync(DiagnosisCreateDto input);
        Task UpdateDiagnosisAsync(DiagnosisUpdateDto input);
        Task<List<DiagnosisResultDto>> GetDiagnosisDetailByPidAsync(PatientDataInputDto input);
        Task<List<DiagnosisResultDto>> GetDiagnosisDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}
