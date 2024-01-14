using Microsoft.Azure.Search;

namespace EMR.Manager.Service.Internal
{
    public interface IAzureSearchClientFactory
    {
        SearchServiceClient Create(string serviceName, string apiKey);
        ISearchIndexClient CreateSearchIndexClient(string serviceName, string indexName, string queryApiKey);
    }


}
