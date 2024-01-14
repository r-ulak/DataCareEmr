using Abp.Runtime.Validation;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.AutoMapper;
using EMR.Entities;

namespace EMR.DTO.PatientSearch.Dto
{
    [AutoMap(typeof(PatientAllergy))]
    public class PatientAllergyUpdateInputDto : ICustomValidate
    {
        [Required]
        public int TenantId { get; set; }
        [Required]
        public long PatientAllergyId { get; set; }
        public string Note { get; set; }
        public string Status { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime Dob { get; set; }
        public long UpdatedBy { get; set; }
        public DateTime UpdateDate { get; set; }
        [Required]
        public long VisitId { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {
            if (StartDate == DateTime.MinValue || StartDate == null)
            {
                StartDate = null;
            }
            else if (!(StartDate <= DateTime.Today && StartDate >= Dob))
            {
                context.Results.Add(new ValidationResult("Date range must be between dob and today"));
            }


            if (!(Status == "active" || Status == "expired" || Status == "inactive"))
            {
                context.Results.Add(new ValidationResult("Invalid Status"));
            }
        }
    }
}
