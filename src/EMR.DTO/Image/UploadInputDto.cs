using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using System.Text.RegularExpressions;
using Abp.Runtime.Validation;

namespace EMR.DTO
{
    public class UploadInputDto
    {
        [DataMember]
        [StringLength(5)]
        [MinLength(3)]
        [Required]
        public string Extension { get; set; }

        [Range(100, 5242880)] //5MB
        public int FileSize { get; set; }

        public void AddValidationErrors(CustomValidationContext context)
        {
            var rg = new Regex(EMRConsts.EMRAllowedUploadExtension);
            if (!rg.IsMatch(Extension))
            {
                context.Results.Add(new ValidationResult("Invalid Extension"));
            }
        }

    }
}
