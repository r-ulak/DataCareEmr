using Hangfire.Server;

namespace EMR.Manager.Service.Internal
{
    public interface IAzureIndexManager
    {
        bool StartIndexingAzureSearch(AzureDataIndexer dataIndexer);
        PerformContext Context { get; set; }
    }


}
