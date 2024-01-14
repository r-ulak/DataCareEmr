using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using EMR.DTO.Common;
using EMR.Entities;
using EMR.Manager.Service.Internal;
using Abp.UI;

namespace EMR.Surgery
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class SurgeryAppService : EMRAppServiceBase, ISurgeryAppService
    {
        private readonly ISurgeryManager _surgeryManager;
        private readonly IAzureRunSearch _azureRunSearch;
        private readonly IICDCodePCSManager _icdPcsCodeManager;

        public SurgeryAppService(ISurgeryManager surgeryManager, IAzureRunSearch azureRunSearch, IICDCodePCSManager icdPcsCodeManager)
        {
            _surgeryManager = surgeryManager;
            _azureRunSearch = azureRunSearch;
            _icdPcsCodeManager = icdPcsCodeManager;
        }

        public async Task<long> CreateSurgery(SurgeryCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            var codeExists = await _icdPcsCodeManager.CheckPCSExists(new ICDCodePCSInputDto()
            {
                ICDCodePCSId = input.ICDCodePCSId,
                TenantId = (int)input.TenantId
            });
            if (!codeExists)
            {
                throw new UserFriendlyException("ICDPCS code or Custom Code Could not be found");
            }
            return await _surgeryManager.CreateSurgeryAsync(input);
        }

        public async Task UpdateSurgery(SurgeryUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _surgeryManager.UpdateSurgeryAsync(input);
        }

        public async Task<List<SurgeryResultDto>> GetSurgeryDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _surgeryManager.GetSurgeryDetailByPidAsync(input);
        }

        public async Task<IEnumerable<ICDCodePCSResultDto>> GetPCSCode(AzureSearchInputDto input)
        {
            input.TenantId = GetTenantId();
            input.Limit = EMRConsts.EMRAzureICD10PCSLimit;
            input.IndexName = EMRConsts.EMRAzureIndexNameICD10PCS;
            return await _azureRunSearch.SearchAsync<ICDCodePCSResultDto>(input);
        }

        public async Task<List<SurgeryResultDto>> GetSurgeryDetailByVisitIdAndPid(PatientVisitDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _surgeryManager.GetSurgeryDetailByVisitIdAndPidAsync(input);
        }
    }
}
