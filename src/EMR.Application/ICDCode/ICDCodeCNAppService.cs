using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using Abp.Timing;
using Abp.UI;

namespace EMR.ICDCodeCN
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class ICDCodeCNAppService : EMRAppServiceBase, IICDCodeCNAppService
    {
        private readonly IICDCodeCNManager _icdcodecnManager;

        public ICDCodeCNAppService(IICDCodeCNManager icdcodecnManager)
        {
            _icdcodecnManager = icdcodecnManager;
        }

        public async Task CreateICDCodeCN(ICDCodeCNCreateUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            var codeExists = await _icdcodecnManager.CheckCNExists(new ICDCodeCNInputDto()
            {
                ICDCodeCNId = input.ICDCodeCNId,
                TenantId = (int)input.TenantId
            });
            if (codeExists)
            {
                throw new UserFriendlyException("ICDCN code or Custom Code already exists");
            }
            await _icdcodecnManager.CreateICDCodeCNAsync(input);
        }
    }
}
