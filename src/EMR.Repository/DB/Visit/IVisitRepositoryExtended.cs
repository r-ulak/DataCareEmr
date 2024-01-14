using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IVisitRepositoryExtended : IVisitRepository
    {
        Task<VisitResultDto> GetVisitDetailByPidAsync(PatientDataInputDto input);
        Task<List<VisitResultDto>> GetActiveVisitByLoggedInUserAsync(VisitSearchInputDto input);
        Task UpdateCurrentlyVisited(VisitCreateDto input);
        Task<List<VisitResultDto>> GetVisitHistoryByPidAsync(PatientDataInputDto input);

    }
}

