using Abp.Application.Navigation;
using Abp.Localization;
using EMR.Authorization;

namespace EMR.Web
{
    /// <summary>
    /// This class defines menus for the application.
    /// It uses ABP's menu system.
    /// When you add menu items here, they are automatically appear in angular application.
    /// See .cshtml and .js files under App/Main/views/layout/header to know how to render menu.
    /// </summary>
    public class EMRNavigationProvider : NavigationProvider
    {
        public override void SetNavigation(INavigationProviderContext context)
        {
            context.Manager.MainMenu
                .AddItem(new MenuItemDefinition("Home", L("HomePage"), url: "#/", icon: "fa fa-home"))
                .AddItem(new MenuItemDefinition("Patient", L("Patient"), icon: "fa fa-globe")
                    .AddItem(new MenuItemDefinition("RegisterPatient", L("RegisterPatient"), url: "#/patient/register", icon: "fa fa-plus", requiredPermissionName: PermissionNames.PagesUsers))
                    .AddItem(new MenuItemDefinition("SearchPatient", L("SearchPatient"), url: "#/patient/search", icon: "fa fa-search", requiredPermissionName: PermissionNames.PagesUsers)))
                .AddItem(new MenuItemDefinition("Appointment", L("Appointment"), url: "#/appointment", icon: "fa fa-calendar", requiredPermissionName: PermissionNames.PagesUsers))
                .AddItem(new MenuItemDefinition("Administration", L("Administration"), icon: "fa fa-wrench")
                    .AddItem(new MenuItemDefinition("Role", L("Role"), url: "#/admin/role", icon: "fa fa-briefcase", requiredPermissionName: PermissionNames.PagesUsers))
                    .AddItem(new MenuItemDefinition("Users", L("Users"), url: "#/admin/user", icon: "fa fa-user", requiredPermissionName: PermissionNames.PagesUsers))
                    .AddItem(new MenuItemDefinition("AuditLogs", L("AuditLogs"), url: "#/admin/auditlogs", icon: "fa fa-log", requiredPermissionName: PermissionNames.PagesUsers)))

                    ;
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, EMRConsts.LocalizationSourceName);
        }
    }
}
