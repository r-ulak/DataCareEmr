using Abp.AutoMapper;
using EMR.Entities;
using System;

namespace EMR.DTO
{
    [AutoMapFrom(typeof(Immunizations))]
    public class ImmunizationsResultDto
    {
        public string ImmunizationName { get; set; }
        public int ImmunizationCodeId { get; set; }
        public string Note { get; set; }
        public string InformationSource { get; set; }
        public string AdministrationSiteName { get; set; }
        public DateTime CreateDate { get; set; }
        public int CreatedBy { get; set; }
        public int CompletionStatusCodeId { get; set; }
        public string CompletionStatusName { get; set; }
        public string Status { get; set; }
        public DateTime AdministeredDate { get; set; }
        public int AdministeredById { get; set; }
        public string AdministeredByName { get; set; }
    }
}
