using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;
using System;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for UnitCode
    /// </summary>
    public class LoincUnitCodeManager : ILoincUnitCodeManager, ISingletonDependency
    {
        private readonly ILoincUnitCodeRepository _unitcodeRepository;
        private readonly IRedisCacheStore _cacheStore;
        public LoincUnitCodeManager(ILoincUnitCodeRepository unitcodeRepository, IRedisCacheStore cacheStore)
        {
            _unitcodeRepository = unitcodeRepository;
            _cacheStore = cacheStore;
        }

        public async Task<LoincUnitCode> GetUnitCodeAsync(LoincUnitCode input)
        {
            return await _cacheStore.GetAsync("LoincUnitCode", EMRConsts.TwentyFourHourTimeSpan,
() => _unitcodeRepository.GetByLoincCodeIdAsync(input.LoincCodeId, input.TenantId));
        }
    }
}
