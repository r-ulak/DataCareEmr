using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using System;
using EMR.Entities;

namespace EMR.Roles.Dto
{
    [AutoMapTo(typeof(AbpRoles))]
    public class AddRoleInputDto
    {
        public int RoleId { get; set; }
        public bool IsGranted { get; set; }
    }
}