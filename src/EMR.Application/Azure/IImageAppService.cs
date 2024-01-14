using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Application.Services;
using EMR.AzureStorgae.BlobStorage;
using EMR.DTO;
using EMR.Entities;
using EMR.Manager.Service;

namespace EMR.Azure
{
    public interface IImageAppService : IApplicationService
    {
        StorageResponse GetUploadDetails(UploadInputDto input);
        string GetImageUri(ImageInputDto input);
        Task<List<DocumentResultDto>> GetImageUris(DocumentRequestDto input);
        Task PostUploadDetails(StorageResponse input);
        Task<List<DocumentCategoryCode>> GetDocumentCategoryCode();
        Task<List<DocumentTypeCode>> GetDocumentTypeCode();

    }
}
