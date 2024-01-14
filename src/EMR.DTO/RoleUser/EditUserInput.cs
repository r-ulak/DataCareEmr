using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using Abp.Auditing;
using Abp.AutoMapper;
using EMR.Entities;
using EMR.DTO.Common;
using System.Collections.Generic;
using EMR.DTO.RoleUser;

namespace EMR.Users.Dto
{
    [AutoMap(typeof(AbpUsers))]
    public class EditUserInput 
    {
        [Required]
        public long UserId { get; set; }

        [Required]
        [StringLength(32)]
        public string Name { get; set; }

        [Required]
        [StringLength(32)]
        public string Surname { get; set; }

        [DisableAuditing]
        [StringLength(128)]
        public string Password { get; set; }

        public bool IsActive { get; set; }
        public SessionDto SessionInfo { get; set; }
        public List<int> Roles { get; set; }
    }
}