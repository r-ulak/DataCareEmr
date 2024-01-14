using Abp.Application.Services.Dto;
using System;
using System.ComponentModel.DataAnnotations;

namespace EMR.DTO.PatientSearch.Dto
{
    public class PatientAllergyInputDto 
    {
        [Required]
        [Range(0.0, long.MaxValue)]
        public long PatientId { get; set; }
        public int TenantId { get; set; }
        [Required]
        public long PatientAllergyId { get; set; }
    }
}
