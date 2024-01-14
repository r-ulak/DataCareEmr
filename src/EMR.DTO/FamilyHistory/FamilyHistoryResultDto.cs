using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(FamilyHistory))]
    public class FamilyHistoryResultDto
    {
        public long Id { get; set; }
        public long Pid { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        public string ICDCodeCNId { get; set; }

        [DisplayName("ICDCodeCNName")]
        [DataMember]
        public string ICDCodeCNName { get; set; }

        [DisplayName("ICDCodeCNShortName")]
        [DataMember]
        public string ICDCodeCNShortName { get; set; }


        /// <summary>
        /// 
        /// </summary>
        [DisplayName("FamilyHistoryDate")]
        [DataMember]

        public DateTime? FamilyHistoryDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RelationshipCodeName")]
        [DataMember]

        public string RelationshipCodeName { get; set; }

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
