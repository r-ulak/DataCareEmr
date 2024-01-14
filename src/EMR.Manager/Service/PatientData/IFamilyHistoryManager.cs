using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IFamilyHistoryManager
    {
        Task<long> CreateFamilyHistoryAsync(FamilyHistoryCreateDto input);
        Task UpdateFamilyHistoryAsync(FamilyHistoryUpdateDto input);
        Task<List<FamilyHistoryResultDto>> GetFamilyHistoryDetailByPidAsync(PatientDataInputDto input); 
        Task<List<RelationshipCode>> GetRelationshipCodeAsync();
    }
}
