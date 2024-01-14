using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using System.Collections.Generic;
using EMR.Entities;

namespace EMR.AbpTenants
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class AbpTenantsAppService : EMRAppServiceBase, IAbpTenantsAppService
    {
        private readonly IAbpTenantsManager _abptenantsManager;

        public AbpTenantsAppService(IAbpTenantsManager abptenantsManager)
        {
            _abptenantsManager = abptenantsManager;
        }

        public async Task<List<AdministrationSite>> GetAdministrationSite()
        {
            return await _abptenantsManager.GetAdministrationSiteAsync(GetTenantId());
        }
    }
}
