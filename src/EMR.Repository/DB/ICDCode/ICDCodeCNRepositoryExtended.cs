using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for ICDCodeCN
    /// </summary>
    public class ICDCodeCNRepositoryExtended : ICDCodeCNRepository, IICDCodeCNRepositoryExtended
    {
        public ICDCodeCNRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<bool> CheckCNExists(ICDCodeCNInputDto searchInput)
        {
            return await _procExecutor.ExecuteScalarAsync<bool>("CheckCNExists", new
            {
                searchInput.TenantId,
                searchInput.ICDCodeCNId

            });
        }
    }
}
