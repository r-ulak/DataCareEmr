using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
    [AutoMap(typeof(Appointment))]
    public class AppointmentResultDto
    {
        public string ProviderName { get; set; }
        public string AdministrationSiteName { get; set; }
        public string AppointmentCodeName { get; set; }
        public string AppointmentStatusCodeName { get; set; }
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

        public int? Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ProviderId")]
        [DataMember]
        [Required]

        public int ProviderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentCodeId")]
        [DataMember]
        [Required]

        public int AppointmentCodeId { get; set; }
        [DataMember]
        public int AppointmentStatusCodeId { get; set; }


        [DataMember]
        public string CalendarColor { get; set; }
        [DataMember]
        public string FullName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllDayEvent")]
        [DataMember]
        [Required]

        public bool AllDayEvent { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StartDate")]
        [DataMember]
        [Required]

        public DateTime StartDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EndDate")]
        [DataMember]
        [Required]

        public DateTime EndDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Title")]
        [DataMember]
        [Required]
        [StringLength(255)]
        public string Title { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]

        public int? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Fname")]
        [DataMember]
        [StringLength(50)]
        public string Fname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Lname")]
        [DataMember]
        [StringLength(50)]
        public string Lname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Mname")]
        [DataMember]
        [StringLength(50)]
        public string Mname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DOB")]
        [DataMember]

        public DateTime? DOB { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneCell")]
        [DataMember]
        [StringLength(20)]
        public string PhoneCell { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneHome")]
        [DataMember]
        [StringLength(20)]
        public string PhoneHome { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public string Note { get; set; }

        [DataMember]
        public long CreatedBy { get; set; }

        [DataMember]
        public DateTime CreateDate { get; set; }


    }
}
