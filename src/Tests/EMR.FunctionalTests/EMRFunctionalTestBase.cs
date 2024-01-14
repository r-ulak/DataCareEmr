using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Abp;
using Abp.Configuration.Startup;
using Abp.Runtime.Session;
using Abp.TestBase;
using Castle.Core.Internal;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DataAccess.Infrastructure.Database.Implementation;
using EMR.EntityFramework;
using EMR.Migrations.SeedData;
using EMR.MultiTenancy;
using EMR.Users;
using EntityFramework.DynamicFilters;
using NUnit.Framework;
using Ploeh.AutoFixture;

namespace EMR.IntegrationTests
{
    public abstract class EMRFunctionalTestBase : AbpIntegratedTestBase<EMRFunctionalTestModule>
    {
        protected Fixture fixture = new Fixture();
        private DbConnection _hostDb;
        private Dictionary<int, DbConnection> _tenantDbs; //only used for db per tenant architecture
        protected Fixture _fixture;
        public int TenantId = 9;

        public virtual void EMRIntegrationTestBaseSetup()
        {
            //Seed initial data for host
            AbpSession.TenantId = null;
            UsingDbContext(context =>
            {
                new InitialHostDbBuilder(context).Create();
                new DefaultTenantCreator(context).Create();
            });

            //Seed initial data for default tenant
            AbpSession.TenantId = TenantId;
            AbpSession.UserId = 100;
            UsingDbContext(context =>
            {
                new TenantRoleAndUserBuilder(context, TenantId).Create();
            });

            _fixture = new Fixture();
        }


        /* Uses single database for host and all tenants.


        /* Uses single database for host and Default tenant,
         * but dedicated databases for all other tenants.
         */

        protected override void PreInitialize()
        {
            base.PreInitialize();
            //LocalIocManager.Register<IAppConfigSqlConnection, FakeAppConfigSqlConnection>();
        }

        #region UsingDbContext

        protected IDisposable UsingTenantId(int? tenantId)
        {
            var previousTenantId = AbpSession.TenantId;
            AbpSession.TenantId = tenantId;
            return new DisposeAction(() => AbpSession.TenantId = previousTenantId);
        }

        protected void UsingDbContext(Action<EMRDbContext> action)
        {
            UsingDbContext(AbpSession.TenantId, action);
        }

        protected Task UsingDbContextAsync(Func<EMRDbContext, Task> action)
        {
            return UsingDbContextAsync(AbpSession.TenantId, action);
        }

        protected T UsingDbContext<T>(Func<EMRDbContext, T> func)
        {
            return UsingDbContext(AbpSession.TenantId, func);
        }

        protected Task<T> UsingDbContextAsync<T>(Func<EMRDbContext, Task<T>> func)
        {
            return UsingDbContextAsync(AbpSession.TenantId, func);
        }

        protected void UsingDbContext(int? tenantId, Action<EMRDbContext> action)
        {
            using (UsingTenantId(tenantId))
            {
                using (var context = LocalIocManager.Resolve<EMRDbContext>())
                {
                    context.DisableAllFilters();
                    action(context);
                    context.SaveChanges();
                }
            }
        }

        protected async Task UsingDbContextAsync(int? tenantId, Func<EMRDbContext, Task> action)
        {
            using (UsingTenantId(tenantId))
            {
                using (var context = LocalIocManager.Resolve<EMRDbContext>())
                {
                    context.DisableAllFilters();
                    await action(context);
                    await context.SaveChangesAsync();
                }
            }
        }

        protected T UsingDbContext<T>(int? tenantId, Func<EMRDbContext, T> func)
        {
            T result;

            using (UsingTenantId(tenantId))
            {
                using (var context = LocalIocManager.Resolve<EMRDbContext>())
                {
                    context.DisableAllFilters();
                    result = func(context);
                    context.SaveChanges();
                }
            }

            return result;
        }

        protected async Task<T> UsingDbContextAsync<T>(int? tenantId, Func<EMRDbContext, Task<T>> func)
        {
            T result;

            using (UsingTenantId(tenantId))
            {
                using (var context = LocalIocManager.Resolve<EMRDbContext>())
                {
                    context.DisableAllFilters();
                    result = await func(context);
                    await context.SaveChangesAsync();
                }
            }

            return result;
        }

        #endregion

        #region Login

        protected void LoginAsHostAdmin()
        {
            LoginAsHost(User.AdminUserName);
        }

        protected void LoginAsDefaultTenantAdmin()
        {
            LoginAsTenant(Tenant.DefaultTenantName, User.AdminUserName);
        }

        protected void LoginAsHost(string userName)
        {
            Resolve<IMultiTenancyConfig>().IsEnabled = true;

            AbpSession.TenantId = null;

            var user =
                UsingDbContext(
                    context =>
                        context.Users.FirstOrDefault(
                            u => u.TenantId == AbpSession.TenantId && u.UserName == userName));
            if (user == null)
            {
                throw new Exception("There is no user: " + userName + " for host.");
            }

            AbpSession.UserId = user.Id;
        }

        protected void LoginAsTenant(string tenancyName, string userName)
        {
            var tenant = UsingDbContext(context => context.Tenants.FirstOrDefault(t => t.TenancyName == tenancyName));
            if (tenant == null)
            {
                throw new Exception("There is no tenant: " + tenancyName);
            }

            AbpSession.TenantId = tenant.Id;

            var user =
                UsingDbContext(
                    context =>
                        context.Users.FirstOrDefault(
                            u => u.TenantId == AbpSession.TenantId && u.UserName == userName));
            if (user == null)
            {
                throw new Exception("There is no user: " + userName + " for tenant: " + tenancyName);
            }

            AbpSession.UserId = user.Id;
        }

        #endregion

        /// <summary>
        /// Gets current user if <see cref="IAbpSession.UserId"/> is not null.
        /// Throws exception if it's null.
        /// </summary>
        protected async Task<User> GetCurrentUserAsync()
        {
            var userId = AbpSession.GetUserId();
            return await UsingDbContext(context => context.Users.SingleAsync(u => u.Id == userId));
        }

        /// <summary>
        /// Gets current tenant if <see cref="IAbpSession.TenantId"/> is not null.
        /// Throws exception if there is no current tenant.
        /// </summary>
        protected async Task<Tenant> GetCurrentTenantAsync()
        {
            var tenantId = AbpSession.GetTenantId();
            return await UsingDbContext(context => context.Tenants.SingleAsync(t => t.Id == tenantId));
        }

        protected async Task<int> GetErrorCountAsync()
        {
            return await UsingDbContextAsync(context => context.AuditLogs
                .CountAsync(x => !string.IsNullOrEmpty(x.Exception)));
        }

        protected async Task<List<string>> CheckNewErrors(int startCount, int endCount)
        {
            if (endCount <= startCount) return new List<string>();
            var result = await GetErrors();
            result.ForEach(x =>
            {
                Console.WriteLine(x);
            });
            Assert.Fail("New Error detected {0}", result);
            return result;
        }

        protected async Task<List<string>> GetErrors()
        {
            return await UsingDbContextAsync(context => context.AuditLogs
                .Where(x => !string.IsNullOrEmpty(x.Exception))
                .OrderByDescending(y => y.ExecutionTime)
                .Select(x => x.Exception)
                .ToListAsync());
        }
    }
}