using Abp.AutoMapper;
using EMR.Entities;
using System;

namespace EMR.DTO
{
    [AutoMapFrom(typeof(PatientVital))]
    public class PatientVitalResultDto
    {
        public decimal? Bps { get; set; }
        public decimal? Bpd { get; set; }
        public decimal Weight { get; set; }
        public decimal? Height { get; set; }
        public decimal? Temperature { get; set; }
        public decimal? Pulse { get; set; }
        public decimal? BMI { get; set; }
        public string BMIStatus { get; set; }
        public decimal? OxygenSaturation { get; set; }
        public  DateTime CreateDate { get; set; }
    }
}
