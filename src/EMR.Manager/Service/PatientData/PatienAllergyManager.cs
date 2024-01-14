using System.Collections.Generic;
using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.Redis;
using System;
using Abp.AutoMapper;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public class PatientAllergyManager : IPatientAllergyManager, ISingletonDependency
    {
        private readonly IPatientAllergyRepositoryExtended _patientAllergyRepositoryExtended;
        private readonly IAllergyReactionCodeRepository _allergyReactionCodeRepository;
        private readonly IAllergyCodeRepository _allergyCodeRepository;
        private readonly IAllergySeverityCodeRepository _allergySeverityCodeRepository;
        private readonly IAllergyTypeCodeRepository _allergyTypeCodeRepository;
        private readonly IAllergyCategoryCodeRepository _allergyCategoryCodeRepository;
        private readonly IRedisCacheStore _cacheStore;

        public PatientAllergyManager(IPatientAllergyRepositoryExtended PatientAllergyRepositoryExtended,
            IRedisCacheStore cacheStore,
            IAllergyReactionCodeRepository allergyReactionCodeRepository,
            IAllergyCodeRepository allergyCodeRepository,
            IAllergySeverityCodeRepository allergySeverityCodeRepository,
            IAllergyTypeCodeRepository allergyTypeCodeRepository,
            IAllergyCategoryCodeRepository allergyCategoryCodeRepository
            )
        {
            _patientAllergyRepositoryExtended = PatientAllergyRepositoryExtended;
            _cacheStore = cacheStore;
            _allergyReactionCodeRepository = allergyReactionCodeRepository;
            _allergyCodeRepository = allergyCodeRepository;
            _allergySeverityCodeRepository = allergySeverityCodeRepository;
            _allergyTypeCodeRepository = allergyTypeCodeRepository;
            _allergyCategoryCodeRepository = allergyCategoryCodeRepository;
        }


        public async Task<List<PatientAllergyResultDto>> GetPatientAllergyAsync(PatientDataInputDto input)
        {
            return await _patientAllergyRepositoryExtended.GetPatientAllergyByPidAsync(input);
        }

        public async Task UpdateAllergyAsync(PatientAllergyUpdateInputDto input)
        {
            var currentRecord = await _patientAllergyRepositoryExtended.GetByPatientAllergyIdAsync(input.PatientAllergyId,
                input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.PatientAllergyId;
            await _patientAllergyRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);
        }
        public async Task<List<AllergyReactionCode>> GetAllergyReactionCodeAsync()
        {
            return await _cacheStore.GetAsync("AllergyReactionCode", EMRConsts.TwentyFourHourTimeSpan,
                        () => _allergyReactionCodeRepository.GetAllAsync());
        }
        public async Task<List<AllergyCode>> GetAllergyCodeAsync()
        {
            return await _cacheStore.GetAsync("AllergyCode", EMRConsts.TwentyFourHourTimeSpan,
                () => _allergyCodeRepository.GetAllAsync());
        }
        public async Task<List<AllergyCategoryCode>> GetAllergyCategoryCodeAsync()
        {
            return await _cacheStore.GetAsync("AllergyCategoryCode", EMRConsts.TwentyFourHourTimeSpan,
                () => _allergyCategoryCodeRepository.GetAllAsync());
        }

        //This Method is not used
        public async Task<List<AllergySeverityCode>> GetAllergySeverityCodeAsync()
        {
            return await _cacheStore.GetAsync("AllergySeverityCode", EMRConsts.TwentyFourHourTimeSpan,
                  () => _allergySeverityCodeRepository.GetAllAsync()
                  );
        }
        public async Task<List<AllergyTypeCode>> GetAllergyTypeCodeAsync()
        {
            return await _cacheStore.GetAsync("AllergyTypeCode", EMRConsts.TwentyFourHourTimeSpan,
                  () => _allergyTypeCodeRepository.GetAllAsync()
                  );
        }

        public async Task<long> CreatePatientAllergyAsync(PatientAllergy model)
        {
            return await _patientAllergyRepositoryExtended.InsertAsync(model);
        }
    }
}
