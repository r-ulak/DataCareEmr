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
    /// Repository methods for LifeStyle
    /// </summary>
    public class LifeStyleRepositoryExtended : LifeStyleRepository, ILifeStyleRepositoryExtended
    {
        public LifeStyleRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<LifeStyleResultDto>> GetLifeStyleDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<LifeStyleResultDto>("GetLifeStyleDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<LifeStyleResultDto>();

            return result.ToList();
        }
        public async Task<List<LifeStyleResultDto>> GetLifeStyleDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<LifeStyleResultDto>("GetLifeStyleDetailByVisitIdAndPid", new
            {
                input.TenantId,
                Pid = input.PatientId,
                input.VisitId
            })) ?? new List<LifeStyleResultDto>();

            return result.ToList();
        }

    }
}
