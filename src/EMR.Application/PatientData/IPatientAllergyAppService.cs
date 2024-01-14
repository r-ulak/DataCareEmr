using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.Entities;

namespace EMR.PatientAllergyService
{
    public interface IPatientAllergyAppService : IApplicationService
    {
        Task<List<PatientAllergyResultDto>> GetPatientAllergy(PatientDataInputDto input);
        Task UpdateAllergy(PatientAllergyUpdateInputDto input);
        Task<List<AllergyReactionCode>> GetAllergyReactionCode();
        Task<List<AllergyCode>> GetAllergyCode();
        Task<List<AllergyCategoryCode>> GetAllergyCategoryCode();
        Task<List<AllergySeverityCode>> GetAllergySeverityCode();
        Task<List<AllergyTypeCode>> GetAllergyTypeCode();
        Task<long> CreateAllergy(CreatePatientAllergyInputDto input);
        int GetTenantId();
        long GetLoggedUserId();
    }
}