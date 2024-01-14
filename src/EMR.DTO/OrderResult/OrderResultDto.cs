using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using Castle.Core.Internal;

namespace EMR.DTO
{
    [AutoMap(typeof(OrderResult))]
    [AutoMapFrom(typeof(LoincCode))]
    public class OrderResultDto
    {
        private string _unit;
        private string _rangeValue;

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
        [DisplayName("ResultDate")]
        [DataMember]

        public DateTime? ResultDate { get; set; }
        public long ResultById { get; set; }
        public string ResultByUserName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ShortName")]
        [DataMember]
        [Required]
        [StringLength(40)]
        public string ShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultData")]
        [DataMember]
        [Required]
        [StringLength(255)]
        public string ResultData { get; set; }


        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RangeValue")]
        [DataMember]
        [StringLength(255)]
        public string RangeValue
        {
            get { return string.IsNullOrEmpty(_rangeValue) ? SuggestedRange.FirstOrDefault() : _rangeValue; }
            set { _rangeValue = value; }
        }

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
        [DisplayName("ResultStatusCodeId")]
        [DataMember]
        public int? ResultStatusCodeId { get; set; }
        public string ResultStatusCodeName { get; set; }


        public string ParentLonicLongName { get; set; }
        public string LoincCodeId { get; set; }
        public string ParentLoincCodeId { get; set; }
        public int ResultDataCodeId { get; set; }
        public int? AdministrationSiteId { get; set; }
        public string AdministrationSiteName { get; set; }
        
        public int AbnormalCodeId { get; set; }
        public string AbnormalCodeName{ get; set; }
        public string UnitsAndRange { get; set; }
        public string UnitsRequired { get; set; }
        public string SubmittedUnits { get; set; }
        public string ExampleUnits { get; set; }
        public string ExampleUcumUnits { get; set; }
        public string ClassName { get; set; }

        public bool IsRad => ClassName != null && ClassName.ToUpper().Contains("RAD");

        public string Unit
        {
            get { return string.IsNullOrEmpty(_unit) ? SuggestedUnits.FirstOrDefault() : _unit; }
            set { _unit = value; }
        }


        public List<string> UnitsFromRange
        {
            get
            {
                return SuggestedRange?.Select(x => x.Split(':')[0]).ToList() ?? new List<string>();
            }
        }

        public string[] SuggestedRange
        {
            get
            {
                var result = (UnitsAndRange?.Split(';') ?? new string[] { }).Select(x => x.Replace("\"", string.Empty)).ToList();
                result.RemoveAll(x => x.IsNullOrEmpty());
                return result.Distinct().ToArray();
            }
        }

        public List<string> SuggestedUnits
        {
            get
            {
                var results = new List<string>();
                results.AddRange(ExampleUcumUnits?.Split(';') ?? new string[] { });
                results.AddRange(SubmittedUnits?.Split(';') ?? new string[] { });
                results.AddRange(ExampleUnits?.Split(';') ?? new string[] { });
                results.AddRange(UnitsFromRange);
                results.RemoveAll(x => x == null || x.IsNullOrEmpty());
                return results.Select(x => x.Trim()).
                    Distinct().ToList();
            }
        }
    }
}
