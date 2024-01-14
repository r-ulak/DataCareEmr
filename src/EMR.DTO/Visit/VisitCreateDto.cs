using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
    [AutoMap(typeof(Visit))]
    public class VisitCreateDto : ICustomValidate
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
        [DisplayName("TenantId")]
        [DataMember]
        [Required]

        public int TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitStatusCodeId")]
        [DataMember]
        [Required]

        public int VisitStatusCodeId { get; set; }

        [DisplayName("AdministrationSiteId")]
        [DataMember]
        [Required]

        public int AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitCodeId")]
        [DataMember]
        [Required]

        public int VisitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoctorId")]
        [DataMember]
        [Required]

        public long DoctorId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("NurseId")]
        [DataMember]
        [Required]

        public long NurseId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Reason")]
        [DataMember]
        [StringLength(1500)]
        [MinLength(5)]
        public string Reason { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]

        public DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]

        public DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]

        public long CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]

        public long UpdatedBy { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {

        }

    }
}
