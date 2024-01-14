using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.DAL
{
    public interface IICDCodePCSRepositoryExtended : IICDCodePCSRepository
    {
        Task<bool> CheckPCSExists(ICDCodePCSInputDto searchInput);

    }
}

