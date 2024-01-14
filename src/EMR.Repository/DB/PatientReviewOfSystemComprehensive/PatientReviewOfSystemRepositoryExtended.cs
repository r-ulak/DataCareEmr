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
    /// Repository methods for PatientReviewOfSystem
    /// </summary>
    public class PatientReviewOfSystemRepositoryExtended : PatientReviewOfSystemRepository, IPatientReviewOfSystemRepositoryExtended, ISingletonDependency
    {
        public PatientReviewOfSystemRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<PatientReviewOfSystemResultDto>> GetPatientReviewOfSystemDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<PatientReviewOfSystemResultDto>("GetPatientReviewOfSystemDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<PatientReviewOfSystemResultDto>();

            return result.ToList();
        }

        public async Task<List<ReviewOfSystemCodeResultDto>> GetPatientReviewOfSystemDetailByVisitIdAndPidAsync(PatientReviewOfSystemnputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<ReviewOfSystemCodeResultDto>("GetPatientReviewOfSystemDetailByVisitIdAndPid", new
            {
                input.TenantId,
                Pid = input.PatientId,
                input.VisitId,
                input.IsShortCode
            })) ?? new List<ReviewOfSystemCodeResultDto>();

            return result.ToList();
        }

        public async Task DeletePatientReviewOfSystemDetailByVisitIdAndPidAsync(PatientReviewOfSystemnputDto input)
        {
            await _procExecutor.ExecuteAsync("DeletePatientReviewOfSystemDetailByVisitIdAndPid", new
            {
                input.TenantId,
                Pid = input.PatientId,
                input.VisitId,
                input.IsShortCode

            });

        }

    }
}
