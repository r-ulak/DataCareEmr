using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
    [AutoMap(typeof(OrderResult))]
    public class OrderResultUpdateDto : ICustomValidate
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
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultStatusCodeId")]
        [DataMember]

        public virtual Int32? ResultStatusCodeId { get; set; }

        [DisplayName("ResultStatusCode")]
        [DataMember]

        public string ResultStatusCode { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]

        public virtual DateTime? UpdateDate { get; set; }


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
