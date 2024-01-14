using Abp.AutoMapper;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using EMR.Entities;

namespace EMR.DTO
{
    [AutoMap(typeof(ReviewOfSystemCode))]
    public class ReviewOfSystemCodeResultDto
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemCodeId")]
        [DataMember]

        public int ReviewOfSystemCodeId { get; set; }

        [IgnoreDataMember]
        public int SortOrder { get; set; }
        public bool NormalLimits { get; set; }
        public bool IsShortCode { get; set; }
        public string Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [IgnoreDataMember]
        public string ReviewOfSystemGroupCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemCodeName")]
        [DataMember]
        [Required]
        [StringLength(255)]
        public string ReviewOfSystemCodeName { get; set; }

    }
}
