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
    [AutoMap(typeof(OrderResult))]
    public class OrderResultCreateDto : ICustomValidate
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
        [DisplayName("OrderId")]
        [DataMember]
        [Required]
        [Range(1, long.MaxValue)]
        public long OrderId { get; set; }

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
        [DisplayName("ResultDate")]
        [DataMember]
        [Required]

        public DateTime ResultDate { get; set; }
        [Required]
        public DateTime OrderDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultById")]
        [DataMember]
        [Range(1, long.MaxValue)]
        [Required]

        public long ResultById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public string LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentLoincCodeId")]
        [DataMember]
        [StringLength(10)]
        public string ParentLoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultDataCodeId")]
        [DataMember]
        [Required]

        public int ResultDataCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultData")]
        [DataMember]
        [Required]
        [StringLength(255)]
        [MinLength(2)]
        public string ResultData { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]

        public int? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UnitCodeId")]
        [DataMember]
        [Required]

        public int UnitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RangeValue")]
        [DataMember]
        [StringLength(255)]
        public string RangeValue { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AbnormalCodeId")]
        [DataMember]
        [Required]

        public int AbnormalCodeId { get; set; }


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
        [DisplayName("ResultStatusCodeId")]
        [DataMember]

        public int? ResultStatusCodeId { get; set; }

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
            DateValidator.ValidateDateWithMinDate(OrderDate, context, ResultDate);
        }

    }
}
