using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using Abp.Runtime.Validation;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace EMR.DTO.PatientSearch.Dto
{
    [AutoMapTo(typeof(PatientData))]
    [AutoMapFrom(typeof(PatientData))]
    public class PatientDataDto : ICustomValidate
    {
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        public int TenantId { get; set; }

        [DisplayName("Pid")]
        [DataMember]
        public int Pid { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Fname")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public string Fname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Lname")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public string Lname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Mname")]
        [DataMember]
        [StringLength(50)]
        public string Mname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DOB")]
        [DataMember]
        public DateTime? DOB { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Street")]
        [DataMember]

        [StringLength(50)]
        public string Street { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PostalCode")]
        [DataMember]

        [StringLength(20)]
        public string PostalCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("City")]
        [DataMember]

        [StringLength(40)]
        public string City { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("State")]
        [DataMember]

        [StringLength(20)]
        public string State { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("County")]
        [DataMember]
        [StringLength(50)]
        public string County { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CountryCode")]
        [DataMember]
        [Required]
        [StringLength(2)]
        public string CountryCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DriversLicense")]
        [DataMember]

        [StringLength(50)]
        public string DriversLicense { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IdentificationNumber")]
        [DataMember]
        [StringLength(25)]
        public string IdentificationNumber { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneHome")]
        [DataMember]

        [StringLength(20)]
        public string PhoneHome { get; set; }

        [DisplayName("EmergencyContactPhone")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public string EmergencyContactPhone { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EmergencyContactName")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public string EmergencyContactName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ContactRelationship")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public string ContactRelationship { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneCell")]
        [DataMember]

        [StringLength(20)]
        public string PhoneCell { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Gender")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public string Gender { get; set; }


        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Email")]
        [DataMember]

        [StringLength(50)]
        public string Email { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Race")]
        [DataMember]

        [StringLength(50)]
        public string Race { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Ethnicity")]
        [DataMember]

        [StringLength(50)]
        public string Ethnicity { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("BillingNote")]
        [DataMember]
        [StringLength(50)]
        public string BillingNote { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeceasedDate")]
        [DataMember]

        public DateTime? DeceasedDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeceasedReason")]
        [DataMember]

        [StringLength(350)]
        public string DeceasedReason { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {
            if (string.IsNullOrEmpty(PhoneCell.Trim()) && string.IsNullOrEmpty(PhoneHome.Trim()))
            {
                context.Results.Add(new ValidationResult("At least one Phone is requreid"));
            }
        }
        public PatientDataDto()
        {
            DeceasedReason = string.Empty;
        }
    }
}
