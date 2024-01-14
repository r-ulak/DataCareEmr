using Abp.AutoMapper;
using EMR.Entities;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(LoincCode))]
    public class LoincCodeInputDto
    {
        [DataMember]
        [StringLength(7)]
        [Required]
        public string LoincCodeId { get; set; }
        [Required]
        public int TenantId { get; set; }



    }
}
