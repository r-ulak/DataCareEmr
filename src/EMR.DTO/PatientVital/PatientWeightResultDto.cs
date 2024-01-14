using Abp.Application.Services.Dto;
using System;

namespace EMR.DTO
{
    public class PatientWeightResultDto 
    {
        public decimal Weight { get; set; }
        public DateTime DateCreated { get; set; }

    }
}
