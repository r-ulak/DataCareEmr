using EMR.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EMR.DAL
{
    public interface IReviewOfSystemCodeRepositoryExtended : IReviewOfSystemCodeRepository
    {
        Task<List<ReviewOfSystemCodeResultDto>> GetAllReviewOfSystemCodeAsync();
    }
}

