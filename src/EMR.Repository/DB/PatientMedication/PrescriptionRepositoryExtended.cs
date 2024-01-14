using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public class PrescriptionRepositoryExtended : PrescriptionRepository, IPrescriptionRepositoryExtended, ISingletonDependency
    {
        public PrescriptionRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

        public async Task<List<PrescriptionResultDto>> GetPrescriptionDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<PrescriptionResultDto>("GetPrescriptionDetailByPid", new
            {
                Pid = input.PatientId,
                TenantId = input.TenantId
            })) ?? new List<PrescriptionResultDto>();
            return result.ToList();
        }

        public async Task<List<PrescriptionResultDto>> GetPrescriptionTimeLineByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<PrescriptionResultDto>("GetPrescriptionTimeLineByPid", new
            {
                Pid = input.PatientId,
                TenantId = input.TenantId
            })) ?? new List<PrescriptionResultDto>();
            return result.ToList();
        }
        public async Task<List<PrescriptionResultDto>> GetPrescriptionDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<PrescriptionResultDto>("GetPrescriptionDetailByVisitIdAndPid", new
            {
                input.TenantId,
                Pid = input.PatientId,
                input.VisitId
            })) ?? new List<PrescriptionResultDto>();

            return result.ToList();
        }
    }
}
