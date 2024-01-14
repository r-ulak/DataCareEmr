using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IProcedureOrderManager
    {
        Task<long> CreateProcedureOrderAsync(ProcedureOrderCreateDto input);
        Task UpdateProcedureOrderAsync(ProcedureOrderUpdateDto input);
        Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByPidAsync(PatientDataInputDto input);
        Task<List<LoincCodeResultDto>> GetParentLoincCodesAsync(LoincCodeInputDto input);
        Task<List<LoincPanelCodeResultDto>> GetChildrenLoincCodesAsync(LoincCodeInputDto input);
        Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}
