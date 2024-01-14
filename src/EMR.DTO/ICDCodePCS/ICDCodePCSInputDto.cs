using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(ICDCodePCS))]
    public class ICDCodePCSInputDto
    {
        [DataMember]
        [StringLength(7)]
        [Required]
        public string ICDCodePCSId { get; set; }
        [Required]
        public int TenantId { get; set; }



    }
}
