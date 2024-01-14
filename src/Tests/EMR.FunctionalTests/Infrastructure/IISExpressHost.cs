using Castle.Core.Logging;
using TestStack.Seleno.Configuration;

namespace EMR.FunctionalTests.Infrastructure
{
    public static class IISExpressHost
    {
        public static readonly SelenoHost Instance = new SelenoHost();

        static IISExpressHost()
        {
            Instance.Run("EMR.Web", 19456,
                configure => configure
                    .WithRemoteWebDriver(BrowserFactory.FireFox)
                    .UsingLoggerFactory(new ConsoleFactory())

            );
        }
    }
}