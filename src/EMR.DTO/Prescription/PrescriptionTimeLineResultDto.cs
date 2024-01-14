using System.Collections.Generic;
using System.ComponentModel;

namespace EMR.DTO
{
    public class PrescriptionTimeLineResultDto
    {
        [DisplayName("Label")]
        public string DrugName => string.IsNullOrEmpty(RxNormName) ? Name : RxNormName;

        public string Name { get; set; }
        public string RxNormName { get; set; }

        [DisplayName("Dates")]
        public IEnumerable<PrescriptionTimeLineRange> DateRanges { get; set; }
    }
}
