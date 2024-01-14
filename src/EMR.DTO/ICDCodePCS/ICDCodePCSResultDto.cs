using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(ICDCodePCS))]
    public class ICDCodePCSResultDto
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSId")]
        [DataMember]
        [StringLength(7)]
        public virtual String ICDCodePCSId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String ICDCodePCSName { get; set; }

    }
}
