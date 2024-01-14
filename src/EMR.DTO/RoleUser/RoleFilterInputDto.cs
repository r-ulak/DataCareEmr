using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using EMR.DTO.Common;

namespace EMR.Roles.Dto
{
    public class RoleFilterInputDto 
    {
        [Required]
        public int FilteredRoleId { get; set; }
        public string RoleName { get; set; }
        public bool IsDefault { get; set; }
        public SessionDto SessionInfo { get; set; }
    }
}