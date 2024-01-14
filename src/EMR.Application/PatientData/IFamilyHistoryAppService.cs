using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.FamilyHistory
{
    public interface IFamilyHistoryAppService : IApplicationService
    {
        Task<long> CreateFamilyHistory(FamilyHistoryCreateDto input);
        Task UpdateFamilyHistory(FamilyHistoryUpdateDto input);
        Task<List<FamilyHistoryResultDto>> GetFamilyHistoryDetailByPid(PatientDataInputDto input);
        Task<List<RelationshipCode>> GetRelationshipCode();

    }
}
