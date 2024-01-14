using System.Threading.Tasks;
using EMR.DTO.Common;
using Microsoft.Azure.Search;
using Microsoft.Azure.Search.Models;
using System.Collections.Generic;
using System.Linq;
using Abp.Dependency;

namespace EMR.Manager.Service.Internal
{
    public class AzureRunSearch : IAzureRunSearch, ISingletonDependency
    {
        private readonly IAzureSearchIndexTypeResolver _azureSearchIndexTypeResolver;

        public AzureRunSearch(IAzureSearchIndexTypeResolver azureSearchIndexTypeResolver)
        {
            _azureSearchIndexTypeResolver = azureSearchIndexTypeResolver;
        }

        public async Task<IEnumerable<T>> SearchAsync<T>(AzureSearchInputDto input) where T : class
        {
            var indexType = _azureSearchIndexTypeResolver.ResolveByIndex(input.IndexName);
            var indexClient = indexType.GetSearchIndexClient();


            var suggesterName = indexType.SuggesterName;
            return (await indexClient.Documents.SuggestAsync<T>(input.Term, suggesterName,
                   indexType.GetAutoCompleteSearchParameters(input)
               )).Results.Select(x => x.Document);

        }
    }
}