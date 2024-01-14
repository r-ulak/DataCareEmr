using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using System.Collections.Generic;
using EMR.Entities;

namespace EMR.StatusCodeSerivce
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class StatusCodeAppService : EMRAppServiceBase, IStatusCodeAppService
    {
        private readonly IStatusCodeManager _statuscodeManager;

        public StatusCodeAppService(IStatusCodeManager statuscodeManager)
        {
            _statuscodeManager = statuscodeManager;
        }


        public async Task<List<StatusCode>> GetStatusCode()
        {
            return await _statuscodeManager.GetStatusCodeAsync();
        }
    }
}
