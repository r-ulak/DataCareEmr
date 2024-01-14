using Abp.Authorization;
using EMR.Authorization.Roles;
using EMR.MultiTenancy;
using EMR.Users;

namespace EMR.Authorization
{
    public class PermissionChecker : PermissionChecker<Tenant, Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {

        }
    }
}
