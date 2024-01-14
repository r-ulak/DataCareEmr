using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace EMR.DTO
{
    [AutoMap(typeof(ProcedureOrder))]
    public class ProcedureOrderResultDto
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        public long Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]

        public long Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PriorityCodeName")]
        [DataMember]
        [Required]

        public string PriorityCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderDate")]
        [DataMember]
        [Required]

        public DateTime OrderDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderdByName")]
        [DataMember]
        [Required]

        public string OrderdByName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public string LoincCodeId { get; set; }

        public string LongCommonName { get; set; }
        public string ShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public string Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeName")]
        [DataMember]

        public string StatusCodeName { get; set; }
        public int StatusCodeId { get; set; }

        public string ClassName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ShowAddRadTestReport")]
        [DataMember]

        public bool ShowAddRadTestReport => ClassName != null && ClassName.ToUpper().Contains("RAD");
    }
}
