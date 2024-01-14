using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface ISurgeryManager
    {
        Task<long> CreateSurgeryAsync(SurgeryCreateDto input);
        Task UpdateSurgeryAsync(SurgeryUpdateDto input);
        Task<List<SurgeryResultDto>> GetSurgeryDetailByPidAsync(PatientDataInputDto input);
        Task<List<SurgeryResultDto>> GetSurgeryDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}
