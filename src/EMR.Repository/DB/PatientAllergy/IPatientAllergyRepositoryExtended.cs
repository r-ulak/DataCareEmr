using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IPatientAllergyRepositoryExtended : IPatientAllergyRepository
    {
        Task<List<PatientAllergyResultDto>> GetPatientAllergyByPidAsync(PatientDataInputDto input);

    }
}
