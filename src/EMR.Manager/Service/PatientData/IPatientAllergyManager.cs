using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface IPatientAllergyManager
    {
        Task<List<PatientAllergyResultDto>> GetPatientAllergyAsync(PatientDataInputDto input);
        Task UpdateAllergyAsync(PatientAllergyUpdateInputDto input);
        Task<List<AllergyReactionCode>> GetAllergyReactionCodeAsync();
        Task<List<AllergyCode>> GetAllergyCodeAsync();
        Task<List<AllergyCategoryCode>> GetAllergyCategoryCodeAsync();
        Task<List<AllergySeverityCode>> GetAllergySeverityCodeAsync();
        Task<List<AllergyTypeCode>> GetAllergyTypeCodeAsync();
        Task<long> CreatePatientAllergyAsync(PatientAllergy model);

    }
}
