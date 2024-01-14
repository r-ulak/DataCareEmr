using Abp.Application.Services.Dto;
using System.ComponentModel.DataAnnotations;

namespace EMR.DTO.PatientSearch.Dto
{
    public class PatientDataInputDto 
    {
        [Required]
        [Range(0.0, long.MaxValue)]
        public long PatientId { get; set; }
        public int TenantId { get; set; }
    }
}
