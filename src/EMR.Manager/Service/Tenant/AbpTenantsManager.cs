using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DAL;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for AbpTenants
    /// </summary>
    public class AbpTenantsManager : IAbpTenantsManager, ISingletonDependency
    {
        private readonly IAbpTenantsRepositoryExtended _abptenantsRepositoryExtended;
        private readonly IAdministrationSiteRepository _administrationSiteRepository;
        private readonly IRedisCacheStore _cacheStore;
        public AbpTenantsManager(IAbpTenantsRepositoryExtended abptenantsRepositoryExtended, IAdministrationSiteRepository administrationSiteRepository, IRedisCacheStore cacheStore)
        {
            _abptenantsRepositoryExtended = abptenantsRepositoryExtended;
            _administrationSiteRepository = administrationSiteRepository;
            _cacheStore = cacheStore;
        }

        public async Task<List<AdministrationSite>> GetAdministrationSiteAsync(int tenantId)
        {
            return await _cacheStore.GetAsync("AdministrationSite", EMRConsts.TwentyFourHourTimeSpan,
                 () => _administrationSiteRepository.GetAllAsync(tenantId));
        }
    }
}
