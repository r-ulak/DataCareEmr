using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    public class DocumentTypeCodeManager : IDocumentTypeCodeManager, ISingletonDependency
    {
        private readonly IDocumentTypeCodeRepository _documenttypecodeRepository;
        private readonly IRedisCacheStore _cacheStore;

        public DocumentTypeCodeManager(IDocumentTypeCodeRepository documenttypecodeRepository,
            IRedisCacheStore cacheStore)
        {
            _documenttypecodeRepository = documenttypecodeRepository;
            _cacheStore = cacheStore;
        }

        public async Task<List<DocumentTypeCode>> GetDocumentTypeCodeAsync()
        {
            return await _cacheStore.GetAsync("DocumentTypeCode", EMRConsts.TwentyFourHourTimeSpan,
                () => _documenttypecodeRepository.GetAllAsync());
        }
    }
}
