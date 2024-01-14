using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for ResultDataCode
    /// </summary>
    public class ResultDataCodeManager : IResultDataCodeManager, ISingletonDependency
    {
        private readonly IResultDataCodeRepository _resultdatacodeRepository;
        private readonly IRedisCacheStore _cacheStore;
        public ResultDataCodeManager(IResultDataCodeRepository resultdatacodeRepository, IRedisCacheStore cacheStore)
        {
            _resultdatacodeRepository = resultdatacodeRepository;
            _cacheStore = cacheStore;
        }

        public async Task<List<ResultDataCode>> GetResultDataCodeAsync()
        {
            return await _cacheStore.GetAsync("ResultDataCode", EMRConsts.TwentyFourHourTimeSpan,
  () => _resultdatacodeRepository.GetAllAsync());
        }
    }
}
