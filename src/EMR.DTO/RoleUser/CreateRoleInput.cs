using Abp.AutoMapper;
using System;
using EMR.Entities;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace EMR.Roles.Dto
{
    [AutoMapTo(typeof(AbpRoles))]
    public class CreateRoleInput 
    {
        public int RoleId { get; set; }

        public string Name { get; set; }
        public string DisplayName { get; set; }
        public DateTime CreationTime { get; set; }
        public bool IsDefault { get; set; }
        public List<PermissionsResultDto> PermissionInput { get; set; }

    }
}