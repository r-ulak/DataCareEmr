using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel.DataAnnotations;
using Abp.Runtime.Validation;
using EMR.Helper;

namespace EMR.DTO
{
    [AutoMap(typeof(Immunizations))]
    public class CreateUpdateImmunizationsDto : ICustomValidate
    {
        public long Id { get; set; }
        [Required]
        public long Pid { get; set; }
        public long VisitId { get; set; }
        [Required]
        public int ImmunizationCodeId { get; set; }
        public string Note { get; set; }
        [StringLength(31)]
        [Required]
        public string InformationSource { get; set; }
        public int AdministrationSiteId { get; set; }
        public int? TenantId { get; set; }
        public DateTime CreateDate { get; set; }
        public long CreatedBy { get; set; }
        public long UpdatedBy { get; set; }
        public DateTime UpdateDate { get; set; }
        [Required]
        public int CompletionStatusCodeId { get; set; }
        [Required]
        public DateTime AdministeredDate { get; set; }
        public int AdministeredById { get; set; }
        public DateTime Dob { get; set; }
        [Required]
        public string Status { get; set; }
        public void AddValidationErrors(CustomValidationContext context)
        {

            DateValidator.ValidateDateWithMinDate(Dob, context, AdministeredDate);

            if (Pid == 0)
            {
                context.Results.Add(new ValidationResult("Patient Identifier must be valid"));
            }
            if (!(Status == "active" || Status == "expired" || Status == "inactive"))
            {
                context.Results.Add(new ValidationResult("Invalid Status"));
            }
        }


    }
}
