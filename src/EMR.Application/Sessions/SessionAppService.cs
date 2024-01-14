using System.Threading.Tasks;
using Abp.Auditing;
using Abp.Authorization;
using Abp.AutoMapper;
using EMR.Sessions.Dto;

namespace EMR.Sessions
{
    [AbpAuthorize]
    public class SessionAppService : EMRAppServiceBase, ISessionAppService
    {
        [DisableAuditing]
        public async Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations()
        {
            var output = new GetCurrentLoginInformationsOutput
            {
                User = (await GetCurrentUserAsync()).MapTo<UserLoginInfoDto>()
            };

            if (AbpSession.TenantId.HasValue)
            {
                output.Tenant = (await GetCurrentTenantAsync()).MapTo<TenantLoginInfoDto>();
            }

            return output;
        }
    }
}