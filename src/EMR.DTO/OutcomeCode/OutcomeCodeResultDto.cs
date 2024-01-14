using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
[AutoMap(typeof(OutcomeCode))]
    public class OutcomeCodeResultDto
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OutcomeCodeId")]
        [DataMember]
        public virtual Int32 OutcomeCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OutcomeCodeName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String OutcomeCodeName { get; set; }

    }
}
