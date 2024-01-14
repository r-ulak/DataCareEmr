using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for Visit
    /// </summary>
    public class VisitRepositoryExtended : VisitRepository, IVisitRepositoryExtended
    {
        public VisitRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

        public async Task<List<VisitResultDto>> GetVisitHistoryByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<VisitResultDto>("GetVisitHistoryByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<VisitResultDto>();

            return result.ToList();
        }

        public async Task<VisitResultDto> GetVisitDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<VisitResultDto>("GetVisitDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<VisitResultDto>();

            return !result.Any() ? new VisitResultDto() : result.First();
        }

        public async Task<List<VisitResultDto>> GetActiveVisitByLoggedInUserAsync(VisitSearchInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<VisitResultDto>("GetActiveVisitByLoggedInUser", new
            {
                input.TenantId,
                input.LoggedInUserId,
                input.SkipCount,
                input.PageSize,
                input.FilterByLoggedUser
            })) ?? new List<VisitResultDto>();

            return result.ToList();
        }

        public async Task UpdateCurrentlyVisited(VisitCreateDto input)
        {
            await _procExecutor.ExecuteAsync("UpdatePatientCurrentlyInVisit", new
            {
                input.TenantId,
                input.UpdatedBy,
                input.UpdateDate,
                input.Pid
            });
        }
    }
}
