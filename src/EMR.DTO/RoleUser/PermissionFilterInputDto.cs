using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;

namespace EMR.Roles.Dto
{
    public class PermissionFilterInputDto 
    {
        [Required]
        public long FilteredPermission { get; set; }
        public string FilteredPermissionName { get; set; }
        public int TenantId { get; set; }
    }
}