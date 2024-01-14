using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
[AutoMap(typeof(PatientReviewOfSystem))]
    public class PatientReviewOfSystemResultDto
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
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

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
        [DisplayName("ReviewOfSystemCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 ReviewOfSystemCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

    }
}
