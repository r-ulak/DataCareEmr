using Abp.AutoMapper;
using EMR.Entities;
using System;

namespace EMR.DTO
{
    [AutoMapFrom(typeof(Prescription))]
    public class PrescriptionResultDto
    {
        public string DrugName => string.IsNullOrEmpty(RxNormName) ? Name : RxNormName;

        public int PrescriptionId { get; set; }
        public string Name { get; set; }
        public string RxNormName { get; set; }
        public string DoseUnitCodeName { get; set; }
        public decimal DoseSize { get; set; }
        public string FrequencyCodeName { get; set; }
        public int Quantity { get; set; }
        public string Dose
        {
            get
            {
                return DoseSize + " " + DoseUnitCodeName;
            }
        }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public DateTime? RefillDate { get; set; }
        public string ConditionName { get; set; }
        public bool PrimaryCondition { get; set; }
        public int Refills { get; set; }
        public string DrugFormCodeName { get; set; }
        public string DrugRouteCodeName { get; set; }
        public string TherapyCodeName { get; set; }
        public int Dosage { get; set; }
        public string Note { get; set; }
        public int Duration { get; set; }
        public string Provider { get; set; }
        public string SecondaryCondition { get; set; }
        public string StatusCodeName { get; set; }
        public int StatusCodeId { get; set; }
        
    }
}
