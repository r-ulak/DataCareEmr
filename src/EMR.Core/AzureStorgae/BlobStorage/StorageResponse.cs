using System.ComponentModel.DataAnnotations;

namespace EMR.AzureStorgae.BlobStorage
{
    public class StorageResponse
    {
        public string Id { get; set; }
        [Required]
        [Range(1, long.MaxValue)]
        public long Pid { get; set; }
        public int DocumentCategoryCodeId { get; set; }
        public int DocumentTypeCodeId { get; set; }
        public string BlobUrl { get; set; }
        public string BlobSASToken { get; set; }
        [Required]
        public string ServerFileName { get; set; }
        public string StorageAccountName { get; set; }
        [Required]
        public string RefrenceTableName { get; set; }
        public string DocumentDescription { get; set; }
        public string Note { get; set; }
        [Required]
        [Range(1, long.MaxValue)]
        public long RefrenceTableId { get; set; }
    }
}
