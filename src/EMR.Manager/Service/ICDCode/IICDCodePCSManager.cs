using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.Manager.Service
{
    public interface IICDCodePCSManager
    {
        Task<bool> CheckPCSExists(ICDCodePCSInputDto input);
            Task CreateICDCodePCSAsync(ICDCodePCSCreateUpdateDto input);
    }
}
