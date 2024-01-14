using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
    [AutoMap(typeof(Appointment))]
    public class AppointmentCreateDto : ICustomValidate
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

        public int? Pid { get; set; }

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

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentStatusCodeId")]
        [DataMember]
        [Required]

        public int AppointmentStatusCodeId { get; set; }


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

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]

        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]

        public DateTime UpdateDate { get; set; }

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
        [Required]

        public long UpdatedBy { get; set; }
        public bool AllowOverlap { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {

        }

    }
}
