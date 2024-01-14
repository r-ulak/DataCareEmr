using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface IDocumentController
    {
        string RefrencedTable { get; }
        Task CreateDocumentAsync(DocumentRequestCreateDto input);
        Task<List<long>> GetDocumentsAsync(DocumentRequestDto input);
    }

}
