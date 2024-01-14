using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using EMR.Entities;
using System;
using Abp.AutoMapper;
using Abp.Timing;

namespace EMR.PatientAllergyService
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class PatientAllergyAppService : EMRAppServiceBase, IPatientAllergyAppService
    {
        private readonly IPatientAllergyManager _patientAllergyManager;

        public PatientAllergyAppService(IPatientAllergyManager patientAllergyManager)
        {
            _patientAllergyManager = patientAllergyManager;
        }

        public async Task<List<PatientAllergyResultDto>> GetPatientAllergy(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _patientAllergyManager.GetPatientAllergyAsync(input);
        }

        public async Task UpdateAllergy(PatientAllergyUpdateInputDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _patientAllergyManager.UpdateAllergyAsync(input);
        }
        public async Task<List<AllergyReactionCode>> GetAllergyReactionCode()
        {
            return await _patientAllergyManager.GetAllergyReactionCodeAsync();
        }
        public async Task<List<AllergyCode>> GetAllergyCode()
        {
            return await _patientAllergyManager.GetAllergyCodeAsync();
        }
        public async Task<List<AllergyCategoryCode>> GetAllergyCategoryCode()
        {
            return await _patientAllergyManager.GetAllergyCategoryCodeAsync();
        }
        public async Task<List<AllergySeverityCode>> GetAllergySeverityCode()
        {
            return await _patientAllergyManager.GetAllergySeverityCodeAsync();
        }
        public async Task<List<AllergyTypeCode>> GetAllergyTypeCode()
        {
            return await _patientAllergyManager.GetAllergyTypeCodeAsync();
        }

        public async Task<long> CreateAllergy(CreatePatientAllergyInputDto input)
        {
            input.TenantId = GetTenantId();
            input.Provider = GetLoggedUserId();
            var patientAllergy = input.MapTo<PatientAllergy>();
            patientAllergy.CreateDate = Clock.Now;
            patientAllergy.CreatedBy = input.Provider;
            patientAllergy.Archived = false;
            return await _patientAllergyManager.CreatePatientAllergyAsync(patientAllergy);
        }

    }
}