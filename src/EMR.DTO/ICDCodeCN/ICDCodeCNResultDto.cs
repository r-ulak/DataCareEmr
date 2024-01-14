using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
[AutoMap(typeof(ICDCodeCN))]
    public class ICDCodeCNResultDto
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        [StringLength(7)]
        public virtual String ICDCodeCNId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String ICDCodeCNName { get; set; }

        
    }
}
