using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface ILifeStyleRepositoryExtended : ILifeStyleRepository
    {
        Task<List<LifeStyleResultDto>> GetLifeStyleDetailByPidAsync(PatientDataInputDto input);
        Task<List<LifeStyleResultDto>> GetLifeStyleDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);

    }
}

