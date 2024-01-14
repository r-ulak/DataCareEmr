using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IPatientReviewOfSystemManager
    {
        Task CreatePatientReviewOfSystemAsync(CreatePatientReviewOfSystemDto input);
        Task<List<PatientReviewOfSystemResultDto>> GetPatientReviewOfSystemDetailByPidAsync(PatientDataInputDto input);        
        Task<List<ReviewOfSystemGroupedCodeResultDto>> GetPatientReviewOfSystemDetailByVisitIdAndPidAsync(PatientReviewOfSystemnputDto input);        
   
   }
}
