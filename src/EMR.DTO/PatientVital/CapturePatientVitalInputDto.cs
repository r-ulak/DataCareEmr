using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel.DataAnnotations;
using UnitsNet;

namespace EMR.DTO.PatientSearch.Dto
{
    [AutoMapTo(typeof(PatientVital))]
    public class CapturePatientVitalInputDto 
    {
        [Required]
        public long Pid { get; set; }
        public int TenantId { get; set; }
        [Range(0, 240)]
        public decimal Bps { get; set; }
        [Range(0, 160)]
        public decimal Bpd { get; set; }
        [Range(0, 1000)]
        public decimal WeightCaptured { get; set; }
        [Range(0, 300)]
        public decimal HeightCaptured { get; set; }
        [Range(0, 300)]
        public decimal Height
        {
            get
            {
                if (LenghtUnit.ToLower() != "cm")
                {
                    return (decimal)Length.FromInches(Convert.ToDouble(HeightCaptured)).Centimeters;
                }
                return HeightCaptured;
            }
        }
        public decimal Weight
        {
            get
            {
                if (LenghtUnit.ToLower() != "kg")
                {
                    return (decimal)Mass.FromPounds(Convert.ToDouble(WeightCaptured)).Kilograms;
                }
                return HeightCaptured;
            }
        }
        [Range(0, 200)]
        public decimal TemperatureCaptured { get; set; }
        public decimal Temperature
        {
            get
            {
                if (LenghtUnit.ToLower() != "F")
                {
                    return (decimal)UnitsNet.Temperature.FromDegreesFahrenheit(Convert.ToDouble(TemperatureCaptured)).DegreesCelsius;
                }
                return TemperatureCaptured;
            }
        }

        [Range(0, 300)]
        public decimal Pulse { get; set; }

        public string WeightUnit { get; set; }
        public string TempUnit { get; set; }
        public string LenghtUnit { get; set; }

        public decimal BMI
        {
            get
            {
                return (decimal)Math.Round((double)Weight / Math.Pow((double)Height / 1000.00, 2), 2);
            }
        }
        public string BMIStatus
        {
            get
            {
                if (Age >= 20)
                {
                    if (BMI < 18.5m)
                    {
                        return "Underweight";
                    }
                    else if (BMI >= 18.5m && BMI <= 24.9m)
                    {
                        return "Normal or Healthy Weight";
                    }
                    else if (BMI >= 25.0m && BMI <= 29.9m)
                    {
                        return "Overweight";
                    }
                    else if (BMI >= 30.0m)
                    {
                        return "Obese";
                    }
                }
                return "NA";
            }
        }
        public decimal OxygenSaturation { get; set; }
        public DateTime DateOfBirth { get; set; }
        private int Age
        {
            get
            {
                DateTime today = DateTime.UtcNow;
                int age = today.Year - DateOfBirth.Year;

                if (DateOfBirth > today.AddYears(-age))
                    age--;
                return age;
            }
        }
    }
}
