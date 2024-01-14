using Abp.AutoMapper;
using EMR.Entities;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(LoincCode))]
    public class LoincPanelCodeResultDto
    {
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [StringLength(10)]
        public string LoincCodeId { get; set; }


        [DisplayName("ParentLoincCodeId")]
        [DataMember]
        [StringLength(10)]
        public string ParentLoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Name")]
        [DataMember]
        [StringLength(255)]
        public string Name { get; set; }

        [DisplayName("HasChildren")]
        [DataMember]
        public bool HasChildren { get; set; }
    }
}
