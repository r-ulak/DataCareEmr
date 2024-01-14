using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(Surgery))]
    public class SurgeryResultDto
    {
        public long Id { get; set; }
        public long Pid { get; set; }
        public long VisitId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSId")]
        [DataMember]
        public string ICDCodePCSId { get; set; }

        [DisplayName("ICDCodePCSName")]
        [DataMember]
        public string ICDCodePCSName { get; set; }

        [DisplayName("ICDCodePCSShortName")]
        [DataMember]
        public string ICDCodePCSShortName { get; set; }

      
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SurgeryDate")]
        [DataMember]

        public DateTime? SurgeryDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministeredByName")]
        [DataMember]

        public string AdministeredByName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteName")]
        [DataMember]

        public string AdministrationSiteName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OutcomeCodeName")]
        [DataMember]
        public string OutcomeCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        public string Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeName")]
        [DataMember]
        public string StatusCodeName { get; set; }
        [DataMember]
        public int StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]

        public DateTime UpdateDate { get; set; }


    }
}
