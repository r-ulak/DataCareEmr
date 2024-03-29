using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IImmunizationsRepositoryExtended : IImmunizationsRepository
    {
        Task<List<ImmunizationsResultDto>> GetImmunizationDetailByPidAsync(PatientDataInputDto input);
    }
}

