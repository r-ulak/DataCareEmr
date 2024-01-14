
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for PriorityCode
    /// </summary>
    public class PriorityCodeManager : IPriorityCodeManager, ISingletonDependency
    {
        private readonly IPriorityCodeRepository _prioritycodeRepository;
        private readonly IRedisCacheStore _cacheStore;
        public PriorityCodeManager(IPriorityCodeRepository prioritycodeRepository, IRedisCacheStore cacheStore)
        {
            _prioritycodeRepository = prioritycodeRepository;
            _cacheStore = cacheStore;
        }

        public async Task<List<PriorityCode>> GetPriorityCodeAsync()
        {
            return await _cacheStore.GetAsync("PriorityCode", EMRConsts.TwentyFourHourTimeSpan,
() => _prioritycodeRepository.GetAllAsync());
        }
    }
}
