using Abp.AutoMapper;
using System;
using EMR.Entities;

namespace EMR.Roles.Dto
{
    [AutoMapFrom(typeof(AbpUsers))]
    public class UserResultDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string Surname { get; set; }
        public string EmailAddress { get; set; }
        public virtual bool IsEmailConfirmed { get; set; }
        public virtual DateTime? LastLoginTime { get; set; }
        public virtual bool IsActive { get; set; }
        public virtual DateTime CreationTime { get; set; }
    }
}