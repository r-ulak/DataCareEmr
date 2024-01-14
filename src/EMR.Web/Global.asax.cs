using System;
using System.Configuration;
using System.Linq;
using Abp.Castle.Logging.Log4Net;
using Abp.Web;
using Castle.Facilities.Logging;
using EMR.AzureStorgae;
using Microsoft.ApplicationInsights.Extensibility;

namespace EMR.Web
{
    public class MvcApplication : AbpWebApplication<EMRWebModule>
    {
        protected override void Application_Start(object sender, EventArgs e)
        {
            AbpBootstrapper.IocManager.IocContainer.AddFacility<LoggingFacility>(
                f => f.UseAbpLog4Net().WithConfig("log4net.config")
            );

            base.Application_Start(sender, e);
            // Set iKey based on web.config settings
            TelemetryConfiguration.Active.InstrumentationKey = ApplicationInsightsConfigSettings.InstrumentationKey;
            // Set context properties based on web.config settings using custom telemetry initializers
            TelemetryConfiguration.Active.TelemetryInitializers.Add(new ApplicationInsightsConfigInitializer());
            StorageConfig.Configure(
                ConfigurationManager.AppSettings[EMRConsts.BlobConnectionStringName],
                ConfigurationManager.AppSettings[EMRConsts.BlobAllowedOriginsName].Split(',').ToList()
                ).Wait();


        }
    }
}
