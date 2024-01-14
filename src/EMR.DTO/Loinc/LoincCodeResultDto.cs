using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(LoincCode))]
    public class LoincCodeResultDto
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
        [DisplayName("LongCommonName")]
        [DataMember]
        [StringLength(255)]
        public virtual String LongCommonName { get; set; }

    }
}
