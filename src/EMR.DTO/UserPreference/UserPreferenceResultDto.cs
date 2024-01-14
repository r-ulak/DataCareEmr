using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
namespace EMR.DTO
{
[AutoMap(typeof(UserPreference))]
    public class UserPreferenceResultDto
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        
        public virtual Int64 Id { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CalendarColor")]
        [DataMember]
        [StringLength(7)]
        public virtual String CalendarColor { get; set; }

    }
}
