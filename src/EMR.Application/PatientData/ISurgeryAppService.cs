using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.Common;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Surgery
{
    public interface ISurgeryAppService : IApplicationService
    {
        Task<long> CreateSurgery(SurgeryCreateDto input);
        Task UpdateSurgery(SurgeryUpdateDto input);
        Task<List<SurgeryResultDto>> GetSurgeryDetailByPid(PatientDataInputDto input);
        Task<IEnumerable<ICDCodePCSResultDto>> GetPCSCode(AzureSearchInputDto input);
        Task<List<SurgeryResultDto>> GetSurgeryDetailByVisitIdAndPid(PatientVisitDataInputDto input);
    }
}
