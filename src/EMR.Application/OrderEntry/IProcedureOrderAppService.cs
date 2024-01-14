using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;
using EMR.DTO.Common;

namespace EMR.ProcedureOrder
{
    public interface IProcedureOrderAppService : IApplicationService
    {
        Task<long> CreateProcedureOrder(ProcedureOrderCreateDto input);
        Task<List<AbnormalCode>> GetAbnormalCode();
        Task<List<PriorityCode>> GetPriorityCode();
        Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByPid(PatientDataInputDto input);
        Task<List<ResultStatusCode>> GetResultStatusCode();
        Task<List<ResultDataCode>> GetResultDataCode();
        Task<LoincUnitCode> GetUnitCode(LoincUnitCode input);
        Task<List<SpecimenCode>> GetSpecimenCode();
        Task UpdateProcedureOrder(ProcedureOrderUpdateDto input);
        Task<IEnumerable<LoincCodeResultDto>> GetLabRadCode(AzureSearchInputDto input);
        Task<List<LoincCodeResultDto>> GetParentTestCodes(LoincCodeInputDto input);
        Task CreateLoincCode(LoincCodeCreateDto input);
        Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByVisitIdAndPid(PatientVisitDataInputDto input);

    }
}
