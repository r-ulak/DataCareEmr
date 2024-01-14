using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for ICDCodePCS
    /// </summary>
    public class ICDCodePCSRepositoryExtended : ICDCodePCSRepository, IICDCodePCSRepositoryExtended
    {
        public ICDCodePCSRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<bool> CheckPCSExists(ICDCodePCSInputDto searchInput)
        {
            return await _procExecutor.ExecuteScalarAsync<bool>("CheckPCSExists", new
            {
                searchInput.TenantId,
                searchInput.ICDCodePCSId

            });
        }
    }
}
