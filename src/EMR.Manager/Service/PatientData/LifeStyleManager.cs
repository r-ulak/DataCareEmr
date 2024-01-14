using System;
using System.Collections.Generic;
using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using Abp.AutoMapper;
using EMR.DTO;
using EMR.Entities;
using EMR.DTO.PatientSearch.Dto;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for LifeStyle
    /// </summary>
    public class LifeStyleManager : ILifeStyleManager, ISingletonDependency
    {
        private readonly ILifeStyleRepositoryExtended _lifestyleRepositoryExtended;
        private readonly ILifeStyleTypeRepository _lifeStyleTypeRepository;
        private readonly IRedisCacheStore _cacheStore;
        public LifeStyleManager(ILifeStyleRepositoryExtended lifestyleRepositoryExtended, ILifeStyleTypeRepository lifeStyleTypeRepository, IRedisCacheStore cacheStore)
        {
            _lifestyleRepositoryExtended = lifestyleRepositoryExtended;
            _lifeStyleTypeRepository = lifeStyleTypeRepository;
            _cacheStore = cacheStore;
        }
        public async Task<long> CreateLifeStyleAsync(LifeStyleCreateDto input)
        {
            return await _lifestyleRepositoryExtended.InsertAsync(input.MapTo<LifeStyle>());
        }

        public async Task UpdateLifeStyleAsync(LifeStyleUpdateDto input)
        {
            var currentRecord = await _lifestyleRepositoryExtended.GetByIdAsync(input.Id, input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.Id;
            await _lifestyleRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);
        }

        public async Task<List<LifeStyleResultDto>> GetLifeStyleDetailByPidAsync(PatientDataInputDto input)
        {
            return await _lifestyleRepositoryExtended.GetLifeStyleDetailByPidAsync(input);
        }
        public async Task<List<LifeStyleType>> GetLifeStyleCodeAsync()
        {
            return await _cacheStore.GetAsync("LifeStyleType", EMRConsts.TwentyFourHourTimeSpan,
             () => _lifeStyleTypeRepository.GetAllAsync());
        }
        public async Task<List<LifeStyleResultDto>> GetLifeStyleDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            return await _lifestyleRepositoryExtended.GetLifeStyleDetailByVisitIdAndPidAsync(input);
        }
    }
}
