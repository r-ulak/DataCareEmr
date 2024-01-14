using Abp.Application.Services.Dto;
using System.ComponentModel.DataAnnotations;

namespace EMR.DTO.PatientSearch.Dto
{
    public class PatientSearchInputDto 
    {
        public int SkipCount { get; set; }
        [Required]
        [MinLength(2)]
        public string QueryTerm { get; set; }
        public int PageSize { get; set; }
        public int TenantId { get; set; }
    }
}
