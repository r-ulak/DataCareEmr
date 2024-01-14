using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.Manager.Service
{
    public interface ILoincCodeManager
    {
        Task<bool> CheckLoincExists(LoincCodeInputDto input);
        Task CreateLoincCodeAsync(LoincCodeCreateDto input);
    }
}
