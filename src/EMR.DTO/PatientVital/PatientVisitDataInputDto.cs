using System.ComponentModel.DataAnnotations;

namespace EMR.DTO.PatientSearch.Dto
{
    public class PatientVisitDataInputDto : PatientDataInputDto
    {
        [Required]
        [Range(1, long.MaxValue)]
        public long VisitId { get; set; }
    }
}
