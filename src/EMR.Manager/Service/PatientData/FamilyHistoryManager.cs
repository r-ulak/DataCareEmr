using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for FamilyHistory
    /// </summary>
    public class FamilyHistoryManager : IFamilyHistoryManager, ISingletonDependency
    {
        private readonly IFamilyHistoryRepositoryExtended _familyhistoryRepositoryExtended;
        private readonly IRelationshipCodeRepository _relationshipCodeRepository;
        public FamilyHistoryManager(IFamilyHistoryRepositoryExtended familyhistoryRepositoryExtended,
            IRelationshipCodeRepository relationshipCodeRepository
            )
        {
            _familyhistoryRepositoryExtended = familyhistoryRepositoryExtended;
            _relationshipCodeRepository = relationshipCodeRepository;
        }
        public async Task<long> CreateFamilyHistoryAsync(FamilyHistoryCreateDto input)
        {
            return await _familyhistoryRepositoryExtended.InsertAsync(input.MapTo<FamilyHistory>());
        }

        public async Task UpdateFamilyHistoryAsync(FamilyHistoryUpdateDto input)
        {
            var currentRecord = await _familyhistoryRepositoryExtended.GetByIdAsync(input.Id, input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.Id;
            await _familyhistoryRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);
        }

        public async Task<List<FamilyHistoryResultDto>> GetFamilyHistoryDetailByPidAsync(PatientDataInputDto input)
        {
            return await _familyhistoryRepositoryExtended.GetFamilyHistoryDetailByPidAsync(input);
        }

        public async Task<List<RelationshipCode>> GetRelationshipCodeAsync()
        {
            return await
                 _relationshipCodeRepository.GetAllAsync();
        }
    }
}
