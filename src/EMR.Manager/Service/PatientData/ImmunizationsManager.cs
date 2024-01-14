using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.AutoMapper;
using Abp.Dependency;
using EMR.DAL;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for Immunizations
    /// </summary>
    public class ImmunizationsManager : IImmunizationsManager, ISingletonDependency
    {
        private readonly IImmunizationsRepositoryExtended _immunizationsRepositoryExtended;
        private readonly IImmunizationCodeRepository _immunizationCodeRepository;
        private readonly ICompletionStatusCodeRepository _completionStatusCodeRepository;
        private readonly IInformationSourceRepository _informationSourceRepository;
        private readonly IRedisCacheStore _cacheStore;


        public ImmunizationsManager(IImmunizationsRepositoryExtended immunizationsRepositoryExtended, IImmunizationCodeRepository immunizationCodeRepository, ICompletionStatusCodeRepository completionStatusCodeRepository, IInformationSourceRepository informationSourceRepository, IRedisCacheStore cacheStore)
        {
            _immunizationsRepositoryExtended = immunizationsRepositoryExtended;
            _immunizationCodeRepository = immunizationCodeRepository;
            _completionStatusCodeRepository = completionStatusCodeRepository;
            _informationSourceRepository = informationSourceRepository;
            _cacheStore = cacheStore;
        }
        public async Task<List<ImmunizationsResultDto>> GetImmunizationDetailByPidAsync(PatientDataInputDto input)
        {
            return await _immunizationsRepositoryExtended.GetImmunizationDetailByPidAsync(input);
        }

        public async Task<long> CreateImmunizationAsync(CreateUpdateImmunizationsDto input)
        {
            return await _immunizationsRepositoryExtended.InsertAsync(input.MapTo<Immunizations>());
        }

        public async Task UpdateImmunizationAsync(CreateUpdateImmunizationsDto input)
        {
            await _immunizationsRepositoryExtended.UpdateAsync(input.MapTo<Immunizations>());
        }

        public async Task<List<ImmunizationCode>> GetImmunizationCodeAsync()
        {
            return await _cacheStore.GetAsync("ImmunizationCode", EMRConsts.TwentyFourHourTimeSpan,
             () => _immunizationCodeRepository.GetAllAsync());
        }

        public async Task<List<CompletionStatusCode>> GetCompletionStatusCodeAsync()
        {
            return await _cacheStore.GetAsync("CompletionStatusCode", EMRConsts.TwentyFourHourTimeSpan,
             () => _completionStatusCodeRepository.GetAllAsync());
        }

        public async Task<List<InformationSource>> GetInformationSourceAsync()
        {
            return await _cacheStore.GetAsync("InformationSource", EMRConsts.TwentyFourHourTimeSpan,
             () => _informationSourceRepository.GetAllAsync());
        }
    }
}
