using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IFamilyHistoryRepositoryExtended : IFamilyHistoryRepository
    {
        Task<List<FamilyHistoryResultDto>> GetFamilyHistoryDetailByPidAsync(PatientDataInputDto input);
    }
}

