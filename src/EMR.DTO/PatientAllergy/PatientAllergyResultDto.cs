using Abp.AutoMapper;
using EMR.Entities;
using System;

namespace EMR.DTO
{
    [AutoMapFrom(typeof(PatientAllergy))]
    public class PatientAllergyResultDto
    {
        public long PatientAllergyId { get; set; }
        public string AllergyName { get; set; }
        public string AllergySeverityCodeName { get; set; }
        public string CategoryName { get; set; }
        public string AllergyTypeName { get; set; }
        public string ReactionName { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Note { get; set; }
        public string Status { get; set; }
        public int Provider { get; set; }
        public int Priority { get; set; }
    }
}
