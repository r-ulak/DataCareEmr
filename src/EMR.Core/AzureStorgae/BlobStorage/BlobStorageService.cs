using System;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.Configuration;
using Microsoft.WindowsAzure.Storage.Blob;

namespace EMR.AzureStorgae.BlobStorage
{
    public class BlobStorageService : IBlobStorageService, ISingletonDependency
    {
        private readonly IBlobConnection _blobConnection;
        private const string ContainerPrefix = "container";

        public BlobStorageService(IBlobConnection blobConnection)
        {
            _blobConnection = blobConnection;
        }

        public async Task<bool> CreateContainerAsync(string containerName)
        {
            //Create the private user uploads container if it doesn't exist
            var container = _blobConnection.GetConnection().
                  GetContainerReference(ContainerPrefix + containerName.ToLower());
            return await container.CreateIfNotExistsAsync();
        }

        public string GetBlobContainerSASToken(
            string containerName,
            SharedAccessBlobPermissions permissions,
            int minutes)
        {

            var client = _blobConnection.GetConnection();

            var policy = new SharedAccessBlobPolicy
            {
                Permissions = permissions,
                SharedAccessStartTime = System.DateTime.UtcNow.AddMinutes(-minutes),
                SharedAccessExpiryTime = System.DateTime.UtcNow.AddMinutes(minutes)
            };


            var container = client.GetContainerReference(containerName);

            //Get the SAS token for the container.
            var sasToken = container.GetSharedAccessSignature(policy);

            return sasToken;
        }

        public string GetBlobContainerWriteSASToken(int tenantId)
        {
            return GetBlobContainerSASToken(
              ContainerPrefix + tenantId,
                SharedAccessBlobPermissions.Write, EMRConsts.
                SASTokenExpiration);
        }

        public string GetBlobContainerReadSASToken(int tenantId)
        {
            return GetBlobContainerSASToken(
              ContainerPrefix + tenantId,
                SharedAccessBlobPermissions.Read, EMRConsts.
                SASTokenExpiration);
        }
        public Uri GetBlobUriRead(string fileName, int tenantId)
        {
            var client = _blobConnection.GetConnection();
            var container = client.GetContainerReference(ContainerPrefix + tenantId);
            var blob = container.GetBlockBlobReference(fileName);
            return blob.StorageUri.PrimaryUri;
        }

        public void SetBlobCache(string fileName, int tenantId, int maxAge)
        {
            var client = _blobConnection.GetConnection();
            var container = client.GetContainerReference(ContainerPrefix + tenantId);
            var blob = container.GetBlockBlobReference(fileName);
            blob.Properties.CacheControl = $"max-age={maxAge}, must-revalidate";
            blob.SetProperties();
        }

        public Uri GetBlobUriWrite(string fileName, int tenantId)
        {
            var client = _blobConnection.GetConnection();
            var container = client.GetContainerReference(ContainerPrefix + tenantId);
            var blob = container.GetBlockBlobReference(fileName);
            return blob.StorageUri.PrimaryUri;
        }

        public string GetStorageName()
        {
            return _blobConnection.GetConnection().BaseUri.Authority.Split('.')[0];
        }
    }
}




