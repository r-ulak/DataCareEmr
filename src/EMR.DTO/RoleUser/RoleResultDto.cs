using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using System;
using EMR.Entities;

namespace EMR.Roles.Dto
{
    [AutoMapFrom(typeof(AbpRoles))]
    public class RoleResultDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public DateTime CreationTime { get; set; }
        public bool IsDefault { get; set; }
    }
}