using EMR.DAL;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EMR.Repository.DB.PatientData
{
    public interface IPatientDataRepositoryExtended : IPatientDataRepository
    {
        Task<List<PatientSearchResultDto>> GetPatientSearchByNameAsync(PatientSearchInputDto searchInput);
    }
}
