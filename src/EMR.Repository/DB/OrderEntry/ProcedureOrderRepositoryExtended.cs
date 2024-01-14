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
    /// Repository methods for ProcedureOrder
    /// </summary>
    public class ProcedureOrderRepositoryExtended : ProcedureOrderRepository, IProcedureOrderRepositoryExtended
    {
        public ProcedureOrderRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<ProcedureOrderResultDto>("GetProcedureOrderDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<ProcedureOrderResultDto>();

            return result.ToList();
        }

        public async Task<List<LoincCodeResultDto>> GetParentLoincCodesAsync(LoincCodeInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<LoincCodeResultDto>("GetParentLoincCodes", new
            {
                input.LoincCodeId
            })) ?? new List<LoincCodeResultDto>();

            return result.ToList();
        }

        public async Task<List<LoincPanelCodeResultDto>> GetChildrenLoincCodesAsync(LoincCodeInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<LoincPanelCodeResultDto>("GetChildrenLoincCodes", new
            {
                input.LoincCodeId
            })) ?? new List<LoincPanelCodeResultDto>();

            return result.ToList();
        }

        public async Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<ProcedureOrderResultDto>("GetProcedureOrderDetailByVisitIdAndPid", new
            {
                input.TenantId,
                Pid = input.PatientId,
                input.VisitId
            })) ?? new List<ProcedureOrderResultDto>();

            return result.ToList();
        }
    }
}
