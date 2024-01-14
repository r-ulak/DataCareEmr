namespace EMR.DTO.Common
{
    public class AzureSearchInputDto
    {
        public int Limit { get; set; }
        public int TenantId { get; set; }
        public string Term { get; set; }
        public string IndexName { get; set; }
    }
}
