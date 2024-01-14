using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
[AutoMap(typeof(UserPreference))]
    public class UserPreferenceCreateDto : ICustomValidate
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
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CalendarColor")]
        [DataMember]
        [StringLength(7)]
        public virtual String CalendarColor { get; set; }

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
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

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
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    public void AddValidationErrors(CustomValidationContext context)
    {

    }
    
    }
}
