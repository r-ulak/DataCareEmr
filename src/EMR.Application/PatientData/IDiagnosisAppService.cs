using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.Common;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Diagnosis
{
    public interface IDiagnosisAppService : IApplicationService
    {
        Task<long> CreateDiagnosis(DiagnosisCreateDto input);
        Task UpdateDiagnosis(DiagnosisUpdateDto input);
        Task<List<DiagnosisResultDto>> GetDiagnosisDetailByPid(PatientDataInputDto input);
        Task<IEnumerable<ICDCodeCNResultDto>> GetCNCode(AzureSearchInputDto input);
        Task<List<DiagnosisResultDto>> GetDiagnosisDetailByVisitIdAndPid(PatientVisitDataInputDto input);

    }
}
