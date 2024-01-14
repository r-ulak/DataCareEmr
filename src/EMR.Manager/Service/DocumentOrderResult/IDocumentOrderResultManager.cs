using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.Manager.Service
{
    public interface IDocumentOrderResultManager
    {
            Task CreateDocumentOrderResultAsync(DocumentOrderResultCreateDto input);
            
    }
}
