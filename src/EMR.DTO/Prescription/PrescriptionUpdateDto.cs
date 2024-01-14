using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;

namespace EMR.DTO
{
    [AutoMap(typeof(Prescription))]
    public class PrescriptionUpdateDto : ICustomValidate
    {

        public int PrescriptionId { get; set; }
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
        [DisplayName("TenantId")]
        [DataMember]
        [Required]

        public Int32 TenantId { get; set; }

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
        [DisplayName("EndDate")]
        [DataMember]
        public DateTime? EndDate { get; set; }

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

        public int? StatusCodeId { get; set; }

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
        [DisplayName("UpdatedBy")]
        [DataMember]

        public long? UpdatedBy { get; set; }


        public void AddValidationErrors(CustomValidationContext context)
        {
        }
    }
}
