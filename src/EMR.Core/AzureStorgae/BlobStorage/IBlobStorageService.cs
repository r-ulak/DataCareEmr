using System;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.Storage.Blob;

namespace EMR.AzureStorgae.BlobStorage
{
    public interface IBlobStorageService
    {
        Task<bool> CreateContainerAsync(string containerName);
        string GetBlobContainerSASToken(string containerName, SharedAccessBlobPermissions permissions, int minutes);
        string GetBlobContainerWriteSASToken(int tenantId);
        Uri GetBlobUriWrite(string fileName, int tenantId);
        string GetStorageName();
        string GetBlobContainerReadSASToken(int tenantId);
        Uri GetBlobUriRead(string fileName, int tenantId);
        void SetBlobCache(string fileName, int tenantId, int maxAge);
    }
}
