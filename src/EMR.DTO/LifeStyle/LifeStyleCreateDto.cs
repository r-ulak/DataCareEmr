using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
    [AutoMap(typeof(LifeStyle))]
    public class LifeStyleCreateDto : ICustomValidate
    {
        
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
        [DisplayName("VisitId")]
        [DataMember]
        [Required]

        public long VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]

        public bool Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]

        public long? ParentId { get; set; }

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
        [DisplayName("LifeStyleTypeId")]
        [DataMember]
        [Required]

        public int LifeStyleTypeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("QuitDate")]
        [DataMember]

        public DateTime? QuitDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CurrentlyActive")]
        [DataMember]
        [Required]

        public bool CurrentlyActive { get; set; }

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
        [DisplayName("UpdateDate")]
        [DataMember]

        public DateTime UpdateDate { get; set; }

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
