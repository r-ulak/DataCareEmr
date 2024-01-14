using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IVisitManager
    {
        Task<long> CreateVisitAsync(VisitCreateDto input);
        Task UpdateVisitAsync(VisitUpdateDto input);
        Task<VisitResultDto> GetVisitDetailByPidAsync(PatientDataInputDto input);
        Task<List<VisitStatusCode>> GetVisitStatusCodeAsync();
        Task<List<VisitCode>> GetVisitCodeAsync();
        Task<List<VisitResultDto>> GetActiveVisitByLoggedInUserAsync(VisitSearchInputDto input);
        Task<List<VisitResultDto>> GetVisitHistoryByPidAsync(PatientDataInputDto input);

    }
}
