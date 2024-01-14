using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Runtime.Serialization;
using System.Text.RegularExpressions;

namespace EMR.DTO
{
    [AutoMap(typeof(Document))]
    public class DocumentResultDto
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        public long Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentCategoryCodeId")]
        [DataMember]
        [Required]

        public int DocumentCategoryCodeId { get; set; }
        public string DocumentCategoryCodeName { get; set; }

        [DisplayName("DocumentTypeCodeId")]
        [DataMember]
        [Required]

        public int DocumentTypeCodeId { get; set; }
        public string DocumentTypeCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentDescription")]
        [DataMember]
        [StringLength(255)]
        public string DocumentDescription { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public string Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        public int? StatusCodeId { get; set; }
        [DataMember]
        public string ImageSrc { get; set; }
        [DataMember]
        public string ServerFileName { get; set; }

        [DataMember]
        public string Extension => Path.GetExtension(ServerFileName).ToLower();

        [DataMember]
        public bool IsImage
        {
            get
            {
                var rg = new Regex(EMRConsts.EMRAllowedImageExtension);
                return rg.IsMatch(ServerFileName);
            }
        }

        [DataMember]
        public bool IsPdf => Extension == ".pdf";
        [DataMember]
        public bool IsDicom => Extension == ".dcm" || Extension == ".dcm30";

    }
}
