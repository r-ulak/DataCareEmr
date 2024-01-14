
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for ResultStatusCode
    /// </summary>
    public class ResultStatusCodeManager : IResultStatusCodeManager, ISingletonDependency
    {
        private readonly IResultStatusCodeRepository _resultstatuscodeRepository;
        private readonly IRedisCacheStore _cacheStore;
        public ResultStatusCodeManager(IResultStatusCodeRepository reportstatuscodeRepository, IRedisCacheStore cacheStore)
        {
            _resultstatuscodeRepository = reportstatuscodeRepository;
            _cacheStore = cacheStore;
        }

        public async Task<List<ResultStatusCode>> GetResultStatusCodeAsync()
        {
            return await _cacheStore.GetAsync("ResultStatusCode", EMRConsts.TwentyFourHourTimeSpan,
 () => _resultstatuscodeRepository.GetAllAsync());
        }
    }
}
