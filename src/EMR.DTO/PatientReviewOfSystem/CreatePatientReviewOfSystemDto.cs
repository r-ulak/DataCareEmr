using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
    public class CreatePatientReviewOfSystemDto
    {
        public List<PatientReviewOfSystemCreateDto> ReviewOfSystem { get; set; }
        public bool IsShortCode { get; set; }
    }
}
