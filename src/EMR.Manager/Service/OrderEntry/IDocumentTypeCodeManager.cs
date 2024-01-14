using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface IDocumentTypeCodeManager
    {
        Task<List<DocumentTypeCode>> GetDocumentTypeCodeAsync();
    }
}
