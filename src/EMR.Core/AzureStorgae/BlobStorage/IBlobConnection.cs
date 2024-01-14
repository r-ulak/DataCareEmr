using Abp.Dependency;
using Microsoft.WindowsAzure.Storage.Blob;

namespace EMR.AzureStorgae.BlobStorage
{
	public interface IBlobConnection
    {
        CloudBlobClient GetConnection();
	}
}