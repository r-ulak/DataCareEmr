using System.ComponentModel.DataAnnotations;

namespace EMR.DTO.PatientSearch.Dto
{
    public class PatientReviewOfSystemnputDto : PatientVisitDataInputDto
    {
        [Required]
        public bool IsShortCode { get; set; }
    }
}
