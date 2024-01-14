using System.Collections.Generic;
using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Helper;
using System.Linq;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for DocumentOrderResult
    /// </summary>
    public class DocumentOrderResultManager : IDocumentController
    {
        private readonly IDocumentOrderResultRepositoryExtended _documentorderresultRepositoryExtended;
        public string RefrencedTable { get; private set; }
        public DocumentOrderResultManager(IDocumentOrderResultRepositoryExtended documentorderresultRepositoryExtended)
        {
            _documentorderresultRepositoryExtended = documentorderresultRepositoryExtended;
            RefrencedTable = "DocumentOrderResult";
        }

        public async Task CreateDocumentAsync(DocumentRequestCreateDto input)
        {
            await _documentorderresultRepositoryExtended
                .InsertAsync(DocumentOrderResult.Create(input.RefrenceTableId));
        }

        public async Task<List<long>> GetDocumentsAsync(DocumentRequestDto input)
        {
            var documentIDs = await _documentorderresultRepositoryExtended.GetByOrderResultIdAsync(input.DocumentXrefId);
            return documentIDs.Select(x => x.DocumentId).ToList();
        }
    }
}
