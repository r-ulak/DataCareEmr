using System.Reflection;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Abp.Modules;
using Abp.Web.Mvc;
using Abp.Web.SignalR;
using Abp.Zero.Configuration;
using EMR.Api;

namespace EMR.Web
{
    [DependsOn(
        typeof(EMRDataModule),
        typeof(EMRApplicationModule),
        typeof(EMRWebApiModule),
        //typeof(AbpWebSignalRModule),
        typeof(AbpWebMvcModule))]
    public class EMRWebModule : AbpModule
    {
        public override void PreInitialize()
        {
            //Enable database based localization
            Configuration.Modules.Zero().LanguageManagement.EnableDbLocalization();

            //Configure navigation/menu
            Configuration.Navigation.Providers.Add<EMRNavigationProvider>();

        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());

            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
