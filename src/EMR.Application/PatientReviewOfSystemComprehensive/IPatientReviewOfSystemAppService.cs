using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.PatientReviewOfSystem
{
    public interface IPatientReviewOfSystemAppService : IApplicationService
    {
        Task CreatePatientReviewOfSystem(CreatePatientReviewOfSystemDto input);
        Task<List<PatientReviewOfSystemResultDto>> GetPatientReviewOfSystemDetailByPid(PatientDataInputDto input);
        Task<List<ReviewOfSystemGroupedCodeResultDto>> GetPatientReviewOfSystemDetailByVisitIdAndPid(PatientReviewOfSystemnputDto input);
        Task<List<ReviewOfSystemGroupedCodeResultDto>> GetAllReviewOfSystemCode();

    }
}
