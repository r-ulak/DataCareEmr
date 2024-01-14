using Abp;
using EMR.DTO.Common;
using Microsoft.Azure.Search;
using Microsoft.Azure.Search.Models;

namespace EMR.Manager.Service.Internal
{
    public interface IAzureSearchIndexType
    {
        string JobName { get; }
        string IndexName { get; }
        string SuggesterName { get; }
        
        AzureDataIndexer GetDataIndexer(UserIdentifier user);
        ISearchIndexClient GetSearchIndexClient();
        SuggestParameters GetAutoCompleteSearchParameters(AzureSearchInputDto input);
    }
}
