using System;
using Abp.Authorization.Users;
using Abp.Extensions;
using Microsoft.AspNet.Identity;

namespace EMR.Users
{
    public class User : AbpUser<User>
    {
        public const string DefaultPassword = "123qwe";

        public static string CreateRandomPassword()
        {
            return Guid.NewGuid().ToString("N").Truncate(16);
        }

        public static User CreateTenantAdminUser(int tenantId, string emailAddress, string password)
        {
            return new User
            {
                TenantId = tenantId,
                UserName = AdminUserName,
                Name = AdminUserName,
                Surname = AdminUserName,
                EmailAddress = emailAddress,
                IsEmailConfirmed = false,
                Password = new PasswordHasher().HashPassword(password)
            };
        }
        public static User CreateTenantUser(int tenantId, string emailAddress, string password, string userName)
        {
            return new User
            {
                TenantId = tenantId,
                UserName = userName,
                Name = userName,
                Surname = userName,
                EmailAddress = emailAddress,
                IsEmailConfirmed = false,
                Password = new PasswordHasher().HashPassword(password)
            };
        }
    }
}