using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for ReviewOfSystemCode
    /// </summary>
    public class ReviewOfSystemCodeRepositoryExtended : ReviewOfSystemCodeRepository, IReviewOfSystemCodeRepositoryExtended
    {
        public ReviewOfSystemCodeRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<ReviewOfSystemCodeResultDto>> GetAllReviewOfSystemCodeAsync()
        {
            var result = (await _procExecutor
                .ExecuteProcAsync<ReviewOfSystemCodeResultDto>
                ("GetAllReviewOfSystemCode", new
                {
                }) ?? new List<ReviewOfSystemCodeResultDto>());
            return result.ToList();
        }


    }
}
