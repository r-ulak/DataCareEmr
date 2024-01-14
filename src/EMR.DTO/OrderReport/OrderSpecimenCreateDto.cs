using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
using EMR.Helper;

namespace EMR.DTO
{
    [AutoMap(typeof(OrderSpecimen))]
    public class OrderSpecimenCreateDto : ICustomValidate
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderId")]
        [DataMember]
        [Required]
        [Range(1, long.MaxValue)]
        public virtual Int64 OrderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        [Range(1, long.MaxValue)]

        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CollectedDate")]
        [DataMember]
        [Required]

        public virtual DateTime CollectedDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CollectedById")]
        [DataMember]
        [Required]
        [Range(1, long.MaxValue)]

        public virtual Int64 CollectedById { get; set; }

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
        [DisplayName("StatusCodeId")]
        [DataMember]
        [Required]

        public virtual Int32 StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]

        public virtual Int32? AdministrationSiteId { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int SpecimenCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SpecimenNumber")]
        [DataMember]
        [StringLength(100)]
        [Required]
        public virtual String SpecimenNumber { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]

        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]

        public virtual DateTime UpdateDate { get; set; }

        [DisplayName("OrderDate")]
        [DataMember]
        [Required]

        public virtual DateTime OrderDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]

        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]

        public virtual Int64 UpdatedBy { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {
            DateValidator.ValidateDateWithMinDate(OrderDate, context, CollectedDate);

        }

    }
}
