using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Authorization;
using Abp.AutoMapper;
using Abp.Timing;
using EMR.Authorization;
using EMR.DTO;
using EMR.Azure;
using EMR.AzureStorgae.BlobStorage;
using EMR.Configuration;
using EMR.DAL;
using EMR.Entities;
using EMR.Helper;
using EMR.Manager.Service;

namespace EMR.ICDCodeCN
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class ImageAppService : EMRAppServiceBase, IImageAppService
    {
        private readonly IBlobStorageService _blobStorageService;
        private readonly IDocumentRepository _documentRepository;
        private readonly IDocumentCategoryCodeManager _documentCategoryCodeManager;
        private readonly IDocumentTypeCodeManager _documentTypeCodeManager;
        private readonly IDocumentControllerResolver _documentControllerResolver;

        public ImageAppService(IBlobStorageService blobStorageService,
            IDocumentControllerResolver documentControllerResolver, IDocumentRepository documentRepository, IDocumentCategoryCodeManager documentCategoryCodeManager, IDocumentTypeCodeManager documentTypeCodeManager)
        {
            _blobStorageService = blobStorageService;
            _documentControllerResolver = documentControllerResolver;
            _documentRepository = documentRepository;
            _documentCategoryCodeManager = documentCategoryCodeManager;
            _documentTypeCodeManager = documentTypeCodeManager;
        }

        public StorageResponse GetUploadDetails(UploadInputDto input)
        {
            var tenantId = GetTenantId();
            //Get the SAS token for the container.  Allow writes for 2 minutes
            var sasToken = _blobStorageService.GetBlobContainerWriteSASToken(tenantId);

            //Get the blob so we can get the full path including container name
            var id = Guid.NewGuid().ToString();
            var newFileName = id + "." + input.Extension;

            var blobUrl = _blobStorageService.GetBlobUriWrite(
                newFileName, tenantId).ToString();


            //This function determines which storage account the blob will be
            //uploaded to, enabling the future possibility of sharding across 
            //multiple storage accounts.

            return new StorageResponse
            {
                Id = id,
                StorageAccountName =
                    _blobStorageService.GetStorageName(),
                BlobUrl = blobUrl,
                BlobSASToken = sasToken,
                ServerFileName = newFileName
            };
        }

        public string GetImageUri(ImageInputDto input)
        {
            var tenantId = GetTenantId();
            //Get the SAS token for the container.  Allow writes for 2 minutes
            var sasToken = _blobStorageService.GetBlobContainerReadSASToken(tenantId);
            return _blobStorageService.GetBlobUriRead(
                       input.FileName, tenantId) + sasToken;
        }

        public async Task<List<DocumentResultDto>> GetImageUris(DocumentRequestDto input)
        {
            var tenantId = GetTenantId();
            //Get the SAS token for the container.  Allow writes for 2 minutes
            var sasToken = _blobStorageService.GetBlobContainerReadSASToken(tenantId);
            var documentController = _documentControllerResolver.Resolve(input.RefrenceTableName);
            var documentList = await documentController.GetDocumentsAsync(input);
            var resultlist = new List<DocumentResultDto>();
            await documentList.ForEachAsync(
                async item =>
                {
                    var line = (await _documentRepository.GetByIdAsync(item, tenantId)).MapTo<DocumentResultDto>();
                    line.ImageSrc = _blobStorageService.GetBlobUriRead(line.ServerFileName, tenantId) + sasToken;
                    resultlist.Add(line);
                });
            return resultlist;
        }

        public async Task PostUploadDetails(StorageResponse input)
        {
            var tenantId = GetTenantId();
            _blobStorageService.SetBlobCache(input.ServerFileName, tenantId,
                Convert.ToInt32(GetSettingValue(EMRSettingNames.EmrBlobCacheDuration)));

            var documentController = _documentControllerResolver.Resolve(input.RefrenceTableName);
            var loggedUserId = GetLoggedUserId();
            var documentId = await _documentRepository.InsertAsync(Document.Create(
                input.Pid,
                tenantId,
                input.DocumentTypeCodeId,
                input.DocumentCategoryCodeId,
                input.ServerFileName,
                Clock.Now,
                loggedUserId,
                statusCodeId: EMRConsts.ActiveStatus,
                documentDescription: input.DocumentDescription,
                note: input.Note,
                updateDate: Clock.Now,
                updatedBy: loggedUserId
            ));
            await documentController.CreateDocumentAsync(new DocumentRequestCreateDto()
            {
                RefrenceTableId = input.RefrenceTableId,
                DocumentId = documentId
            });
        }

        public async Task<List<DocumentCategoryCode>> GetDocumentCategoryCode()
        {
            return await _documentCategoryCodeManager.GetDocumentCategoryCodeAsync();
        }
        public async Task<List<DocumentTypeCode>> GetDocumentTypeCode()
        {
            return await _documentTypeCodeManager.GetDocumentTypeCodeAsync();
        }
    }
}
