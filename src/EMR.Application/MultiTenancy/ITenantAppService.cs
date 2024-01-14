using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using EMR.MultiTenancy.Dto;
using EMR.Users;

namespace EMR.MultiTenancy
{
    public interface ITenantAppService : IApplicationService
    {
        ListResultDto<TenantListDto> GetTenants();

        Task<User> CreateTenant(CreateTenantInput input);

        Task<bool> VerifyEmail(long userId, string code);

    }
}
