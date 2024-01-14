using EMR.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using Abp.Dependency;
using EMR.DTO.PatientSearch.Dto;
using EMR.Repository.DB.PatientData;
using EMR.DataAccess.Infrastructure.Database;

namespace EMR.DAL
{
    public class PatientDataRepositoryExtended : PatientDataRepository, IPatientDataRepositoryExtended, ISingletonDependency
    {
        public PatientDataRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<PatientSearchResultDto>> GetPatientSearchByNameAsync(PatientSearchInputDto searchInput)
        {
            var result = (await _procExecutor.ExecuteProcAsync<PatientSearchResultDto>("GetPatientSearchByName", new
            {
                QueryTerm = searchInput.QueryTerm,
                SkipCount = searchInput.SkipCount,
                PageSize = searchInput.PageSize,
                TenantId = searchInput.TenantId

            })) ?? new List<PatientSearchResultDto>();
            return result.ToList();
        }

    }
}
