using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using EMR.Entities;
using System;

namespace EMR.FamilyHistory
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class FamilyHistoryAppService : EMRAppServiceBase, IFamilyHistoryAppService
    {
        private readonly IFamilyHistoryManager _familyhistoryManager;

        public FamilyHistoryAppService(IFamilyHistoryManager familyhistoryManager)
        {
            _familyhistoryManager = familyhistoryManager;
        }

        public async Task<long> CreateFamilyHistory(FamilyHistoryCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            return await _familyhistoryManager.CreateFamilyHistoryAsync(input);
        }

        public async Task UpdateFamilyHistory(FamilyHistoryUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _familyhistoryManager.UpdateFamilyHistoryAsync(input);
        }

        public async Task<List<FamilyHistoryResultDto>> GetFamilyHistoryDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _familyhistoryManager.GetFamilyHistoryDetailByPidAsync(input);
        }

        public async Task<List<RelationshipCode>> GetRelationshipCode()
        {
            return await _familyhistoryManager.GetRelationshipCodeAsync();
        }
    }
}
