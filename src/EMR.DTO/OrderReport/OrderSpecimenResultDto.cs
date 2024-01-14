using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(OrderSpecimen))]
    public class OrderSpecimenResultDto
    {
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        public long Id { get; set; }
        public long OrderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CollectedDate")]
        [DataMember]
        [Required]

        public DateTime CollectedDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CollectedByName")]
        [DataMember]
        [Required]

        public string CollectedByName { get; set; }
        public virtual long CollectedById { get; set; }
        public virtual int StatusCodeId { get; set; }
        public virtual int? AdministrationSiteId { get; set; }
        public int SpecimenCodeId { get; set; }
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
        [Required]

        public string StatusCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteName")]
        [DataMember]

        public string AdministrationSiteName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SpecimenNumber")]
        [DataMember]
        [StringLength(100)]
        public string SpecimenNumber { get; set; }
        public string SpecimenCodeName { get; set; }

    }
}
