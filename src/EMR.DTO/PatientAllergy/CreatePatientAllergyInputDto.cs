using Abp.Application.Services.Dto;
using Abp.Runtime.Validation;
using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using Abp.AutoMapper;
using EMR.Entities;

namespace EMR.DTO.PatientSearch.Dto
{
    [AutoMapTo(typeof(PatientAllergy))]
    public class CreatePatientAllergyInputDto :  ICustomValidate
    {
        [Required]
        [Range(0.0, long.MaxValue)]
        public long Pid { get; set; }
        public long VisitId { get; set; }
        public int TenantId { get; set; }
        public string Note { get; set; }
        [Required]
        public string Status { get; set; }
        [Required]
        public string AllergyName { get; set; }
        [Required]
        public string ReactionName { get; set; }
        [Required]
        public int AllergyTypeId { get; set; }
        [Required]
        public int SeverityId { get; set; }
        [Required]
        public int AllergyCategoryCodeId { get; set; }

        public long Provider { get; set; }
        public DateTime? StartDate { get; set; }
        [Required]
        public DateTime Dob { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {
            if (StartDate == null) return;
            if (StartDate == DateTime.MinValue)
            {
                StartDate = null;
                return;
            }
            if (!(StartDate <= DateTime.Today && StartDate >= Dob))
            {
                context.Results.Add(new ValidationResult("Date range must be between dob and today"));
            }

            if (!(Status == "active" || Status == "expired"))
            {
                context.Results.Add(new ValidationResult("Invalid Status"));
            }
        }
    }
}
