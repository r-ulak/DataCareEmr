using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using System.Text.RegularExpressions;
using Abp.Runtime.Validation;
using EMR.Manager.Service;

namespace EMR.DTO
{
    public class ImageInputDto: DocumentRequestDto
    {
        [DataMember]
        [MinLength(5)]
        [Required]
        public string FileName { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {
            var rg = new Regex(EMRConsts.EMRAllowedUploadExtension);
            if (!rg.IsMatch(FileName))
            {
                context.Results.Add(new ValidationResult("Invalid FileName"));
            }
        }

    }
}
