using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IDiagnosisRepositoryExtended : IDiagnosisRepository
    {
        Task<List<DiagnosisResultDto>> GetDiagnosisDetailByPidAsync(PatientDataInputDto input);
        Task<List<DiagnosisResultDto>> GetDiagnosisDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}

