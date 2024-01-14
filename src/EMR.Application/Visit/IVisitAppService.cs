using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.Visit
{
    public interface IVisitAppService : IApplicationService
    {
        Task<long> CreateVisit(VisitCreateDto input);
        Task UpdateVisit(VisitUpdateDto input);
        Task<VisitResultDto> GetVisitDetailByPid(PatientDataInputDto input);
        Task<List<VisitStatusCode>> GetVisitStatusCode();
        Task<List<VisitCode>> GetVisitCode();
        Task<List<VisitResultDto>> GetActiveVisitByLoggedInUser(VisitSearchInputDto input);
        Task<List<VisitResultDto>> GetVisitHistoryByPid(PatientDataInputDto input);


    }
}
