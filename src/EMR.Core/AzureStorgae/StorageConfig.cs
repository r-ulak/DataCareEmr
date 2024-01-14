using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Shared.Protocol;

namespace EMR.AzureStorgae
{
    public static class StorageConfig
    {
        /// <summary>
        /// Configures the storage account used by the application.
        /// Configures to support CORS, and creates the blob, table,
        /// and queue needed for the app if they don't already exist.
        /// </summary>
        /// <param name="storageConnectionString"></param>
        /// <param name="allowedOrigins"></param>
        /// <returns></returns>
        public static async Task Configure(string storageConnectionString, List<string> allowedOrigins)
        {

            var account = CloudStorageAccount.Parse(storageConnectionString);
            var client = account.CreateCloudBlobClient();
            var serviceProperties = client.GetServiceProperties();

            //Configure CORS
            serviceProperties.Cors = new CorsProperties();
            serviceProperties.Cors.CorsRules.Add(new CorsRule()
            {
                AllowedHeaders = new List<string>() { "*" },
                AllowedMethods = CorsHttpMethods.Put | CorsHttpMethods.Get | CorsHttpMethods.Head | CorsHttpMethods.Post,
                AllowedOrigins = allowedOrigins,
                ExposedHeaders = new List<string>() { "*" },
                MaxAgeInSeconds = 3600 // 60 minutes
            });

            await client.SetServicePropertiesAsync(serviceProperties);
        }
    }
}