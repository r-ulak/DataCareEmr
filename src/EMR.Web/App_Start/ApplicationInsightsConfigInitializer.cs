using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.ApplicationInsights.Channel;

namespace EMR.Web
{
    /// <summary>
    /// This class is called during telemetry context initialization for any TelemetryClient instances. 
    /// It contains logic for setting global properties for all telemetry items types:
    /// 1. Application version
    /// 2. Tag string
    /// </summary>
    public class ApplicationInsightsConfigInitializer
        : ITelemetryInitializer
    {
        public void Initialize(ITelemetry telemetry)
        {

            telemetry.Context.Component.Version = ApplicationInsightsConfigSettings.Version;
            telemetry.Context.Properties["application.insight.tag"] = ApplicationInsightsConfigSettings.Tag;
        }
    }
}