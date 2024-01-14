using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for DocumentCategoryCode
    /// </summary>
    public class DocumentCategoryCodeManager : IDocumentCategoryCodeManager, ISingletonDependency
    {
        private readonly IDocumentCategoryCodeRepository _documentcategorycodeRepository;
        private readonly IRedisCacheStore _cacheStore;

        public DocumentCategoryCodeManager(IDocumentCategoryCodeRepository documentcategorycodeRepository,
            IRedisCacheStore cacheStore)
        {
            _documentcategorycodeRepository = documentcategorycodeRepository;
            _cacheStore = cacheStore;
        }

        public async Task<List<DocumentCategoryCode>> GetDocumentCategoryCodeAsync()
        {
            return await _cacheStore.GetAsync("DocumentCategoryCode", EMRConsts.TwentyFourHourTimeSpan,
                () => _documentcategorycodeRepository.GetAllAsync());
        }
    }
}
