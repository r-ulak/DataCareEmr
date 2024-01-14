using System.ComponentModel.DataAnnotations;

namespace EMR.DTO.PatientSearch.Dto
{
    public class OrderSpecimenInputDto : PatientDataInputDto
    {
        [Required]
        [Range(0.0, long.MaxValue)]
        public long Id { get; set; }
    }
}
