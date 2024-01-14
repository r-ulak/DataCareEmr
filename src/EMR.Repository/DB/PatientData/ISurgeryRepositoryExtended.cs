using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface ISurgeryRepositoryExtended : ISurgeryRepository
    {
        Task<List<SurgeryResultDto>> GetSurgeryDetailByPidAsync(PatientDataInputDto input);
        Task<List<SurgeryResultDto>> GetSurgeryDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}

