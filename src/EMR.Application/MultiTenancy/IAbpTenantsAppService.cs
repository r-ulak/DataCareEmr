using System.Threading.Tasks;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.Entities;

namespace EMR.AbpTenants
{
    public interface IAbpTenantsAppService : IApplicationService
    {
        Task<List<AdministrationSite>> GetAdministrationSite();
    }
}
