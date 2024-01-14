using System;
using System.Web.Configuration;

namespace EMR.Web
{
    /// <summary>
    /// This class contains global AI telemetry configuration settings 
    /// 1. Application version
    /// 2. Tag string
    /// 3. Insrtumentation key
    /// </summary>
    public static class ApplicationInsightsConfigSettings
    {
        // Application version based on assemblyinfo.cs version
        private static string version;
        public static string Version
        {
            get
            {
                if (string.IsNullOrEmpty(version)) 
                { 
                    version = typeof(MvcApplication).Assembly.GetName().Version.ToString(); 
                };
                return version;
            }
        }

        private static string tag;
        public static string Tag
        {
            get
            {
                if (string.IsNullOrEmpty(tag))
                {
                    tag = WebConfigurationManager.AppSettings["application.insight.tag"];
                    if (string.IsNullOrEmpty(tag)) { throw new Exception("Missing tag in Web.config"); };
                };
                return tag;
            }
        }

        private static string iKey;
        public static string InstrumentationKey
        {
            get
            {
                if (string.IsNullOrEmpty(iKey)) 
                { 
                    iKey = WebConfigurationManager.AppSettings["application.insight.key"];
                    if (string.IsNullOrEmpty(iKey)) { throw new Exception("Missing instrumentation key in Web.config"); };
                };
                return iKey;
            }
        }
    }
}