using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
[AutoMap(typeof(ICDCodeCN))]
    public class ICDCodeCNCreateUpdateDto : ICustomValidate
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        [StringLength(7)]
        public virtual String ICDCodeCNId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNShortName")]
        [DataMember]
        [Required]
        [StringLength(60)]
        public virtual String ICDCodeCNShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String ICDCodeCNName { get; set; }

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
