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
    public class VisitUpdateDto : ICustomValidate
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitStatusCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 VisitStatusCodeId { get; set; }

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
        
        public virtual Int32 VisitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoctorId")]
        [DataMember]
        [Required]
        
        public virtual Int64 DoctorId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("NurseId")]
        [DataMember]
        [Required]
        
        public virtual Int64 NurseId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Reason")]
        [DataMember]
        [StringLength(1500)]
        public virtual String Reason { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        
        public virtual DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    public void AddValidationErrors(CustomValidationContext context)
    {

    }
    
    }
}
