using EMR.AzureSearchIndexer;
using Microsoft.Azure.Search.Models;

namespace EMR.Manager.Service.Internal
{
    public class AzureDataIndexer
    {
        public string IndexName { get; set; }
        public string DataSource { get; set; }
        public string Indexer { get; set; }
        public string TableName { get; set; }
        public string Description { get; set; }
        public Index Definition { get; set; }
        public AzureDataIndexerSettings Settings { get; set; }
        public IndexingSchedule Schedule { get; set; }
    }
}
