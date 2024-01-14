using System.Threading.Tasks;
using EMR.DTO.Common;
using Microsoft.Azure.Search.Models;
using System.Collections.Generic;

namespace EMR.Manager.Service.Internal
{
    public interface IAzureRunSearch
    {
        Task<IEnumerable<T>> SearchAsync<T>(AzureSearchInputDto input) where T : class;
    }
}
