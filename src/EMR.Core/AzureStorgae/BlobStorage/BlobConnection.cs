using System.Configuration;
using Abp.Dependency;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;

namespace EMR.AzureStorgae.BlobStorage
{
    public class BlobConnection : IBlobConnection, ISingletonDependency
    {
        public string ConnectionString { get; set; }

        public BlobConnection()
            : this(ConfigurationManager.AppSettings[EMRConsts.BlobConnectionStringName])
        {
        }

        public BlobConnection(string connectionString)
        {
            ConnectionString = connectionString;
        }

        public CloudBlobClient GetConnection()
        {
            var account = CloudStorageAccount.Parse(ConnectionString);
           return account.CreateCloudBlobClient();

        }
    }
}
