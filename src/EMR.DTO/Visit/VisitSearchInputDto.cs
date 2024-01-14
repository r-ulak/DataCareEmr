namespace EMR.DTO.PatientSearch.Dto
{
    public class VisitSearchInputDto 
    {
        public int SkipCount { get; set; }
        public long LoggedInUserId { get; set; }
        public int PageSize { get; set; }
        public int TenantId { get; set; }
        public bool FilterByLoggedUser { get; set; }
    }
}
