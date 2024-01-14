using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.DAL
{
    public interface IICDCodeCNRepositoryExtended : IICDCodeCNRepository
    {
        Task<bool> CheckCNExists(ICDCodeCNInputDto searchInput);

    }
}

