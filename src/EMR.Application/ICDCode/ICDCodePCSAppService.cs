using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using Abp.Timing;
using Abp.UI;

namespace EMR.ICDCodePCS
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class ICDCodePCSAppService : EMRAppServiceBase, IICDCodePCSAppService
    {
        private readonly IICDCodePCSManager _icdcodepcsManager;

        public ICDCodePCSAppService(IICDCodePCSManager icdcodepcsManager)
        {
            _icdcodepcsManager = icdcodepcsManager;
        }

        public async Task CreateICDCodePCS(ICDCodePCSCreateUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            var codeExists = await _icdcodepcsManager.CheckPCSExists(new ICDCodePCSInputDto()
            {
                ICDCodePCSId = input.ICDCodePCSId,
                TenantId = (int) input.TenantId
            });
            if (codeExists)
            {
                throw new UserFriendlyException("ICDPCS code or Custom Code already exists");
            }
            await _icdcodepcsManager.CreateICDCodePCSAsync(input);
        }
    }
}
