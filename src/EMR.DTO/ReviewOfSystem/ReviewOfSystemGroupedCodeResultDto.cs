using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    public class ReviewOfSystemGroupedCodeResultDto
    {

        public Int32 SortOrder { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemCodeId")]
        [DataMember]

        public IEnumerable<ReviewOfSystemCodeResultDto> ReviewOfSystemCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemGroupCodeName")]
        [DataMember]
        [Required]

        public bool IsShort { get; set; }
        public bool IsComprehensive { get; set; }
        public string ReviewOfSystemGroupCodeName { get; set; }
    }
}
