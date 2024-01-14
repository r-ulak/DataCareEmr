using System;
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
    /// Repository methods for Surgery
    /// </summary>
    public class SurgeryRepositoryExtended : SurgeryRepository, ISurgeryRepositoryExtended
    {
        public SurgeryRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<SurgeryResultDto>> GetSurgeryDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<SurgeryResultDto>("GetSurgeryDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<SurgeryResultDto>();

            return result.ToList();
        }
        public async Task<List<SurgeryResultDto>> GetSurgeryDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<SurgeryResultDto>("GetSurgeryDetailByVisitIdAndPid", new
            {
                input.TenantId,
                Pid = input.PatientId,
                input.VisitId
            })) ?? new List<SurgeryResultDto>();

            return result.ToList();
        }
    }
}
