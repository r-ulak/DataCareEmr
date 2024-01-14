using Abp.Dependency;
using Microsoft.Azure.Search;

namespace EMR.Manager.Service.Internal
{
    public class AzureSearchClientFactory : IAzureSearchClientFactory, ISingletonDependency
    {
        public SearchServiceClient Create(string serviceName, string apiKey)
        {
            return new SearchServiceClient(serviceName,
                new SearchCredentials(apiKey));
        }

        public ISearchIndexClient CreateSearchIndexClient(string serviceName, string indexName, string queryApiKey)
        {
            return new SearchIndexClient(serviceName, indexName, new SearchCredentials(queryApiKey));
        }
    }
}