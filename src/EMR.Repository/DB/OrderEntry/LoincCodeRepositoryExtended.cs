using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.Entities;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for LoincCode
    /// </summary>
    public class LoincCodeRepositoryExtended : LoincCodeRepository, ILoincCodeRepositoryExtended
    {
        public LoincCodeRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<bool> CheckLoincExists(LoincCodeInputDto searchInput)
        {
            return await _procExecutor.ExecuteScalarAsync<bool>("CheckLoincExists", new
            {
                searchInput.TenantId,
                searchInput.LoincCodeId

            });
        }

        public async Task<List<LoincCode>> GetLoincCodeByLoincCodeIdAsync(LoincCodeInputDto searchInput)
        {
            var result = await _procExecutor.ExecuteProcAsync<LoincCode>("GetLoincCodeByLoincCodeId", new
            {
                searchInput.TenantId,
                searchInput.LoincCodeId

            }) ?? new List<LoincCode>();
            return result.ToList();
        }
    }
}
