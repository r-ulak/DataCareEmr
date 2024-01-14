using System;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.IdentityFramework;
using Abp.Runtime.Session;
using EMR.MultiTenancy;
using EMR.Users;
using Microsoft.AspNet.Identity;
using Abp.Configuration;

namespace EMR
{
    /// <summary>
    /// Derive your application services from this class.
    /// </summary>
    public abstract class EMRAppServiceBase : ApplicationService
    {
        public TenantManager TenantManager { get; set; }

        public UserManager UserManager { get; set; }

        protected EMRAppServiceBase()
        {
            LocalizationSourceName = EMRConsts.LocalizationSourceName;
        }

        protected virtual Task<User> GetCurrentUserAsync()
        {
            var user = UserManager.FindByIdAsync(AbpSession.GetUserId());
            if (user == null)
            {
                throw new ApplicationException("There is no current user!");
            }

            return user;
        }

        public virtual int GetTenantId()
        {
            return AbpSession.GetTenantId();
        }

        public virtual long GetLoggedUserId()
        {
            return AbpSession.GetUserId();
        }

        public virtual T GetSettingValue<T>(string key) where T : struct
        {
            return SettingManager.GetSettingValue<T>(key);
        }
        public virtual string GetSettingValue(string key)
        {
            return SettingManager.GetSettingValue(key);
        }
        protected virtual Task<Tenant> GetCurrentTenantAsync()
        {
            return TenantManager.GetByIdAsync(AbpSession.GetTenantId());
        }

        protected virtual void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}