using System;
using System.Collections.Generic;
using System.Linq;
using Abp.Dependency;

namespace EMR.Manager.Service.Internal
{
    public class AzureSearchIndexTypeResolver : IAzureSearchIndexTypeResolver, ISingletonDependency
    {
        private readonly IEnumerable<IAzureSearchIndexType> _azureSearchIndexTypes;

        public AzureSearchIndexTypeResolver(IEnumerable<IAzureSearchIndexType> azureSearchIndexTypes)
        {
            _azureSearchIndexTypes = azureSearchIndexTypes;
        }

        public IAzureSearchIndexType Resolve(string jobName)
        {
            var indexType = _azureSearchIndexTypes.FirstOrDefault(item => string.Equals(item.JobName, jobName, StringComparison.CurrentCultureIgnoreCase));
            if (indexType == null)
            {
                throw new ArgumentException("JobName method not found", jobName);
            }
            return indexType;
        }

        public IAzureSearchIndexType ResolveByIndex(string indexName)
        {
            var indexType = _azureSearchIndexTypes.FirstOrDefault(item => string.Equals(item.IndexName, indexName, StringComparison.CurrentCultureIgnoreCase));
            if (indexType == null)
            {
                throw new ArgumentException("IndexName method not found", indexName);
            }
            return indexType;
        }
    }
}
