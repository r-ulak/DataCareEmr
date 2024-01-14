using System;

namespace EMR.DTO
{
    public class PrescriptionTimeLineRange
    {
        public string DoseUnitCodeName { get; set; }
        public decimal DoseSize { get; set; }
        public string FrequencyCodeName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int Strength { get; set; }
    }
}
