using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IPatientReviewOfSystemRepositoryExtended : IPatientReviewOfSystemRepository
    {
        Task<List<PatientReviewOfSystemResultDto>> GetPatientReviewOfSystemDetailByPidAsync(PatientDataInputDto input);    
        Task<List<ReviewOfSystemCodeResultDto>> GetPatientReviewOfSystemDetailByVisitIdAndPidAsync(PatientReviewOfSystemnputDto input);
        Task DeletePatientReviewOfSystemDetailByVisitIdAndPidAsync(PatientReviewOfSystemnputDto input);


    }
}

