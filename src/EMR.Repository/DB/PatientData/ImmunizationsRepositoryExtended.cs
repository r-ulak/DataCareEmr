using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.DTO.RoleUser;
using EMR.Entities;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for Immunizations
    /// </summary>
    public class ImmunizationsRepositoryExtended : ImmunizationsRepository, IImmunizationsRepositoryExtended
    {
        public ImmunizationsRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

        public async Task<List<ImmunizationsResultDto>> GetImmunizationDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<ImmunizationsResultDto>("GetImmunizationDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<ImmunizationsResultDto>();

            return result.ToList();
        }
    }
}
