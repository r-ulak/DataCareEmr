using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
    [AutoMap(typeof(PatientReviewOfSystem))]
    public class PatientReviewOfSystemCreateDto : ICustomValidate
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        public long Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        [Range(1, long.MaxValue)]
        public long Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        [Range(1, long.MaxValue)]

        public long VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]

        public int TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemCodeId")]
        [DataMember]
        [Required]

        public int ReviewOfSystemCodeId { get; set; }
        [Required]
        public bool NormalLimits { get; set; }
        [Required]
        public bool IsShortCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public string Note { get; set; }

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
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]

        public long CreatedBy { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {

        }

    }
}
