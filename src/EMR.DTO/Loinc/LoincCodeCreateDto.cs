using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
[AutoMap(typeof(LoincCode))]
    public class LoincCodeCreateDto : ICustomValidate
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [StringLength(10)]
        public virtual String LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Component")]
        [DataMember]
        [StringLength(255)]
        public virtual String Component { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Property")]
        [DataMember]
        [StringLength(30)]
        public virtual String Property { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TimeAspct")]
        [DataMember]
        [StringLength(15)]
        public virtual String TimeAspct { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SystemCode")]
        [DataMember]
        [StringLength(100)]
        public virtual String SystemCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ScaleType")]
        [DataMember]
        [StringLength(30)]
        public virtual String ScaleType { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("MethodType")]
        [DataMember]
        [StringLength(50)]
        public virtual String MethodType { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ClassName")]
        [DataMember]
        [StringLength(20)]
        public virtual String ClassName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Formula")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Formula { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UnitsRequired")]
        [DataMember]
        [StringLength(1)]
        public virtual String UnitsRequired { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SubmittedUnits")]
        [DataMember]
        [StringLength(30)]
        public virtual String SubmittedUnits { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RelatedNames")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String RelatedNames { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ShortName")]
        [DataMember]
        [StringLength(40)]
        public virtual String ShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LongCommonName")]
        [DataMember]
        [StringLength(255)]
        public virtual String LongCommonName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ExampleUcumUnits")]
        [DataMember]
        [StringLength(255)]
        public virtual String ExampleUcumUnits { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

    public void AddValidationErrors(CustomValidationContext context)
    {

    }
    
    }
}
