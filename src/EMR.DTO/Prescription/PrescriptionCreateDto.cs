using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
using System.Collections.Generic;

namespace EMR.DTO
{
    [AutoMap(typeof(Prescription))]
    public class PrescriptionCreateDto : ICustomValidate
    {

        public Int32 PrescriptionId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugId")]
        [DataMember]
        [Required]

        public Int32 DrugId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]

        public long VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]

        public Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]

        public long Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RxNormName")]
        [DataMember]
        [StringLength(1000)]
        public String RxNormName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoseUnitCodeId")]
        [DataMember]
        [Required]

        public Int32 DoseUnitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoseSize")]
        [DataMember]
        [Required]

        public Single DoseSize { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Dosage")]
        [DataMember]
        [Required]

        public Int32 Dosage { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("FrequencyCodeId")]
        [DataMember]
        [Required]

        public Int32 FrequencyCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugRouteCodeId")]
        [DataMember]
        [Required]

        public Int32 DrugRouteCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugFormCodeId")]
        [DataMember]
        [Required]

        public Int32 DrugFormCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Quantity")]
        [DataMember]
        [Required]

        public Int32 Quantity { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Refills")]
        [DataMember]

        public Int32? Refills { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ProviderId")]
        [DataMember]
        [Required]

        public Int32 ProviderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StartDate")]
        [DataMember]
        [Required]

        public DateTime StartDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Duration")]
        [DataMember]
        [Required]

        public Int32 Duration { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EndDate")]
        [DataMember]
        public DateTime? EndDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RefillDate")]
        [DataMember]

        public DateTime? RefillDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TherapyCodeId")]
        [DataMember]
        [Required]

        public Int32 TherapyCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SubstitutionAllowed")]
        [DataMember]
        [Required]

        public Boolean SubstitutionAllowed { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]

        public Int32? StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]

        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]

        public DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]

        public long? CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]

        public long? UpdatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DataMember]
        public List<ICDCodeCNInputDto> PrimaryCondition { get; set; }

        [DataMember]
        public List<ICDCodeCNInputDto> SecondaryCondition { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {
            if (PrescriptionId != 0) return;
            if (PrimaryCondition == null || PrimaryCondition.Count == 0)
            {
                context.Results.Add(new ValidationResult("At least one PrimaryCondition is requreid"));
            }
        }
        public PrescriptionCreateDto()
        {
            SecondaryCondition = new List<ICDCodeCNInputDto>();
        }
    }
}
