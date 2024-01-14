using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
    [AutoMap(typeof(ProcedureOrder))]
    public class ProcedureOrderCreateDto : ICustomValidate
    {

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
        [DisplayName("VisitId")]
        [DataMember]
        [Required]

        public long VisitId { get; set; }

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
        [DisplayName("PriorityCodeId")]
        [DataMember]
        [Required]

        public int PriorityCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderDate")]
        [DataMember]
        [Required]

        public DateTime OrderDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderdById")]
        [DataMember]
        [Required]
        [Range(1, long.MaxValue)]

        public long OrderdById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [Required]
        [StringLength(10)]
        [MinLength(2)]
        public string LoincCodeId { get; set; }

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
        [DisplayName("StatusCodeId")]
        [DataMember]

        public int StatusCodeId { get; set; }

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
        [Required]

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
        [Required]

        public long UpdatedBy { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {

        }

    }
}
