using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
[AutoMap(typeof(ICDCodePCS))]
    public class ICDCodePCSCreateUpdateDto : ICustomValidate
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSId")]
        [DataMember]
        [StringLength(7)]
        public virtual String ICDCodePCSId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSShortName")]
        [DataMember]
        [Required]
        [StringLength(60)]
        public virtual String ICDCodePCSShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String ICDCodePCSName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

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
        
        public virtual Int64? CreatedBy { get; set; }

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
