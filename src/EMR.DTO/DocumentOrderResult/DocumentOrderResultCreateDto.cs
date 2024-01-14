using Abp.AutoMapper;
using EMR.Entities;
using System;
using System.ComponentModel;
using System.Runtime.Serialization;
using Abp.Runtime.Validation;
namespace EMR.DTO
{
[AutoMap(typeof(DocumentOrderResult))]
    public class DocumentOrderResultCreateDto : ICustomValidate
    {

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentId")]
        [DataMember]
        
        public virtual Int64 DocumentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderResultId")]
        [DataMember]
        
        public virtual Int64 OrderResultId { get; set; }

    public void AddValidationErrors(CustomValidationContext context)
    {

    }
    
    }
}
