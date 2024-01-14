using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using EMR.Entities;
using System;

namespace EMR.DTO
{
    [AutoMapFrom(typeof(PatientData))]
    public class PatientSearchResultDto 
    {
        public string Fname { get; set; }
        public string Mname { get; set; }
        public string Lname { get; set; }
        public DateTime? DOB { get; set; }
        public Int64 Pid { get; set; }
        public string Gender { get; set; }
        public bool CurrentlyInVisit { get; set; }
    }
}
