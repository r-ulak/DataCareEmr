using Abp;
using Abp.Dependency;
using Hangfire;
using Hangfire.Server;

namespace EMR.Manager.Service.Internal
{
    public class AzureSearchIndexService : IAzureSearchIndexService, ISingletonDependency
    {

        private readonly IAzureSearchIndexTypeResolver _azureSearchIndexTypeResolver;
        private readonly IAzureIndexManager _azureIndexManager;

        public AzureSearchIndexService(IAzureSearchIndexTypeResolver azureSearchIndexTypeResolver, IAzureIndexManager azureIndexManager)
        {
            _azureSearchIndexTypeResolver = azureSearchIndexTypeResolver;
            _azureIndexManager = azureIndexManager;
        }


        [DisableConcurrentExecution(0)]
        [AutomaticRetry(Attempts = 0)]
        public bool RunAzureSearcIndex(string jobName, UserIdentifier user, PerformContext context)
        {
            _azureIndexManager.Context = context;
            return _azureIndexManager.StartIndexingAzureSearch(
              _azureSearchIndexTypeResolver.Resolve(jobName).GetDataIndexer(user));
        }
    }
}
