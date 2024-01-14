using Abp.Application.Services.Dto;
using System;

namespace EMR.DTO
{
    public class PatientPulseResultDto 
    {
        public decimal Pulse { get; set; }
        public DateTime DateCreated { get; set; }

    }
}
