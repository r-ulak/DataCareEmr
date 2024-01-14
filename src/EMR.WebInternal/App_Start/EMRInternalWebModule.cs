using System.Reflection;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Abp.Hangfire;
using Abp.Hangfire.Configuration;
using Abp.Modules;
using Abp.Web.Mvc;
using Abp.Zero.Configuration;
using EMR.Api;
using Hangfire;
using Hangfire.Console;

namespace EMR.WebInterenal
{
    [DependsOn(
        typeof(EMRDataModule),
        typeof(EMRApplicationModule),
        typeof(EMRWebApiModule),
        //typeof(AbpWebSignalRModule),
        typeof(AbpHangfireModule),
        typeof(AbpWebMvcModule))]
    public class EMRInternalWebModule : AbpModule
    {
        public override void PreInitialize()
        {
            //Enable database based localization
            Configuration.Modules.Zero().LanguageManagement.EnableDbLocalization();

            //Configure navigation/menu
            Configuration.Navigation.Providers.Add<EMRInternalNavigationProvider>();

            Configuration.BackgroundJobs.UseHangfire(configuration =>
            {
                configuration.GlobalConfiguration.UseSqlServerStorage("Default");
                configuration.GlobalConfiguration.UseConsole();
            });
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());

            AreaRegistration.RegisterAllAreas();
            EMRInternalRouteConfig.RegisterRoutes(RouteTable.Routes);
            EmrInternalBundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
