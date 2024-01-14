using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(Visit))]
    public class VisitResultDto
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

        [DisplayName("Fname")]
        [DataMember]
        public string Fname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Lname")]
        [DataMember]
        public string Lname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Mname")]
        [DataMember]
        public string Mname { get; set; }

        [DisplayName("DOB")]
        [DataMember]
        public DateTime? DOB { get; set; }

        [DisplayName("Gender")]
        [DataMember]
        public string Gender { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]

        public int TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitStatusCodeId")]
        [DataMember]
        [Required]

        public int VisitStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitCodeId")]
        [DataMember]
        [Required]

        public int VisitCodeId { get; set; }
        public string VisitCodeName { get; set; }
        public string AdministrationSiteName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoctorId")]
        [DataMember]
        [Required]

        public long DoctorId { get; set; }
        public string DoctorName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("NurseId")]
        [DataMember]
        [Required]

        public long NurseId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Reason")]
        [DataMember]
        [StringLength(1500)]
        public string Reason { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        public string Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]

        public DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]

        public DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]

        public long CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]

        public long? UpdatedBy { get; set; }

    }
}
