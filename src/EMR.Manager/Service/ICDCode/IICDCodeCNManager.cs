using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.Manager.Service
{
    public interface IICDCodeCNManager
    {
        Task<bool> CheckCNExists(ICDCodeCNInputDto input);
        Task CreateICDCodeCNAsync(ICDCodeCNCreateUpdateDto input);
    }
}
