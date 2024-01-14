using System.ComponentModel.DataAnnotations;
using Abp.Authorization.Users;
using Abp.AutoMapper;
using Abp.MultiTenancy;
using EMR.Users;

namespace EMR.MultiTenancy.Dto
{
    [AutoMapTo(typeof(Tenant))]
    public class CreateTenantInput
    {
        [Required]
        [StringLength(AbpTenantBase.MaxTenancyNameLength)]
        [RegularExpression(Tenant.TenancyNameRegex)]
        public string TenancyName { get; set; }

        [Required]
        [StringLength(Tenant.MaxNameLength)]
        public string Name { get; set; }

        [Required]
        [StringLength(User.MaxEmailAddressLength)]
        public string AdminEmailAddress { get; set; }

        [MaxLength(AbpTenantBase.MaxConnectionStringLength)]
        public string ConnectionString { get; set; }

        [StringLength(User.MaxPlainPasswordLength)]
        public string Password { get; set; }
    }
}