using Abp;
using Hangfire.Server;

namespace EMR.Manager.Service.Internal
{
    public interface IAzureSearchIndexService
    {
        bool RunAzureSearcIndex(string jobName, UserIdentifier user, PerformContext context);
    }
}
