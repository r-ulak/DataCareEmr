using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for AbnormalCode
    /// </summary>
    public class AbnormalCodeManager : IAbnormalCodeManager, ISingletonDependency
    {
        private readonly IAbnormalCodeRepository _abnormalcodeRepository;
        private readonly IRedisCacheStore _cacheStore;
        public AbnormalCodeManager(IAbnormalCodeRepository abnormalcodeRepository, IRedisCacheStore cacheStore)
        {
            _abnormalcodeRepository = abnormalcodeRepository;
            _cacheStore = cacheStore;
        }
        public async Task<List<AbnormalCode>> GetAbnormalCodeAsync()
        {
            return await _cacheStore.GetAsync("AbnormalCode", EMRConsts.TwentyFourHourTimeSpan,
   () => _abnormalcodeRepository.GetAllAsync());

        }
    }
}
