using Abp.AutoMapper;
using EMR.Entities;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(ICDCodeCN))]
    public class ICDCodeCNInputDto
    {
        [DataMember]
        [StringLength(7)]
        [Required]
        public string ICDCodeCNId { get; set; }
        [Required]
        public int TenantId { get; set; }



    }
}
