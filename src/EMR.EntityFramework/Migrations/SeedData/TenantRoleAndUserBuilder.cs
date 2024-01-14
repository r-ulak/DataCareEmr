using System.Linq;
using Abp.Authorization;
using Abp.Authorization.Roles;
using Abp.Authorization.Users;
using Abp.MultiTenancy;
using EMR.Authorization;
using EMR.Authorization.Roles;
using EMR.EntityFramework;
using EMR.Users;
using System.Linq.Dynamic;

namespace EMR.Migrations.SeedData
{
    public class TenantRoleAndUserBuilder
    {
        private readonly EMRDbContext _context;
        private readonly int _tenantId;

        public TenantRoleAndUserBuilder(EMRDbContext context, int tenantId)
        {
            _context = context;
            _tenantId = tenantId;
        }

        public void Create()
        {
            CreateUser(User.AdminUserName, CreateRolesAndUsers(StaticRoleNames.Tenants.Admin));
            //if (System.Diagnostics.Debugger.IsAttached == false)
            //{

            //    System.Diagnostics.Debugger.Launch();

            //}
            for (int i = 0; i <= 15; i++)
            {
                CreateUser($"doctor{i}", CreateRolesAndUsers(StaticRoleNames.Tenants.Doctor));
                CreateUser($"nurse{i}", CreateRolesAndUsers(StaticRoleNames.Tenants.Nurse));
                CreateUser($"reception{i}", CreateRolesAndUsers(StaticRoleNames.Tenants.Reception));
                CreateUser($"pharmacist{i}", CreateRolesAndUsers(StaticRoleNames.Tenants.Pharmacist));
                CreateUser($"radiologist{i}", CreateRolesAndUsers(StaticRoleNames.Tenants.Radiologist));
                CreateUser($"labTechnician{i}", CreateRolesAndUsers(StaticRoleNames.Tenants.LabTechnician));


            }
        }

        private int CreateRolesAndUsers(string roleName)
        {
            //Admin role

            var userRole = _context.Roles.FirstOrDefault(r => r.TenantId == _tenantId && r.Name == roleName);
            if (userRole == null)
            {
                userRole = _context.Roles.Add(new Role(_tenantId, roleName, roleName) { IsStatic = true });
                _context.SaveChanges();

                //Grant all permissions to user role
                var permissions = PermissionFinder
                    .GetAllPermissions(new EMRAuthorizationProvider())
                    .Where(p => p.MultiTenancySides.HasFlag(MultiTenancySides.Tenant))


                    .ToList();

                foreach (var permission in permissions)
                {
                    if (PermissionNames.DefaultRolePermissionList.Count(x => x.Roles.Contains(roleName) & x.PermissionName == permission.Name) > 0)
                    {
                        _context.Permissions.Add(
                            new RolePermissionSetting
                            {
                                TenantId = _tenantId,
                                Name = permission.Name,
                                IsGranted = true,
                                RoleId = userRole.Id
                            });
                    }
                }

                _context.SaveChanges();
            }
            return userRole.Id;
        }

        private void CreateUser(string userName, int roleId)
        {
            //user user

            var userUser = _context.Users.FirstOrDefault(u => u.TenantId == _tenantId && u.UserName == userName);
            if (userUser == null)
            {
                userUser = User.CreateTenantUser(_tenantId, $"{userName}@defaulttenant.com", "123qwe", userName);
                userUser.IsEmailConfirmed = true;
                userUser.IsActive = true;

                _context.Users.Add(userUser);
                _context.SaveChanges();

                //Assign Admin role to user user
                _context.UserRoles.Add(new UserRole(_tenantId, userUser.Id, roleId));
                _context.SaveChanges();
            }
        }
    }
}