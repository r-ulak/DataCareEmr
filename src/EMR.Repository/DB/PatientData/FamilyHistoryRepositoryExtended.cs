using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for FamilyHistory
    /// </summary>
    public class FamilyHistoryRepositoryExtended : FamilyHistoryRepository, IFamilyHistoryRepositoryExtended, ISingletonDependency
    {
        public FamilyHistoryRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<FamilyHistoryResultDto>> GetFamilyHistoryDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<FamilyHistoryResultDto>("GetFamilyHistoryDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<FamilyHistoryResultDto>();

            return result.ToList();
        }
     }
}
