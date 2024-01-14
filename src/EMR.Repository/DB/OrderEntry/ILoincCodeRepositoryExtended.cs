using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;

namespace EMR.DAL
{
    public interface ILoincCodeRepositoryExtended : ILoincCodeRepository
    {
        Task<bool> CheckLoincExists(LoincCodeInputDto searchInput);
        Task<List<LoincCode>> GetLoincCodeByLoincCodeIdAsync(LoincCodeInputDto searchInput);
    }
}

