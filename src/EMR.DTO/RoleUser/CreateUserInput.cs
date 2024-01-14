using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using Abp.Auditing;
using Abp.AutoMapper;
using EMR.Entities;
using EMR.DTO.Common;
using System.Collections.Generic;

namespace EMR.Users.Dto
{
    [AutoMap(typeof(AbpUsers))]
    public class CreateUserInput 
    {
        [Required]
        [StringLength(32)]
        public string UserName { get; set; }

        [Required]
        [StringLength(32)]
        public string Name { get; set; }

        [Required]
        [StringLength(32)]
        public string Surname { get; set; }

        [Required]
        [EmailAddress]
        [StringLength(256)]
        public string EmailAddress { get; set; }

        [Required]
        [DisableAuditing]
        [StringLength(128)]
        public string Password { get; set; }

        public bool IsActive { get; set; }
        public List<int> Roles { get; set; }
        public SessionDto SessionInfo { get; set; }
    }
}