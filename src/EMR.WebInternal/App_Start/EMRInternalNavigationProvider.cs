using Abp.Application.Navigation;
using Abp.Localization;
using EMR.Authorization;

namespace EMR.WebInterenal
{
    /// <summary>
    /// This class defines menus for the application.
    /// It uses ABP's menu system.
    /// When you add menu items here, they are automatically appear in angular application.
    /// See .cshtml and .js files under App/Main/views/layout/header to know how to render menu.
    /// </summary>
    public class EMRInternalNavigationProvider : NavigationProvider
    {
        public override void SetNavigation(INavigationProviderContext context)
        {
            context.Manager.MainMenu
                .AddItem(
                    new MenuItemDefinition(
                        "Home",
                        new LocalizableString("HomePage", EMRConsts.LocalizationSourceName),
                        url: "#/",
                        icon: "fa fa-home"
                        )
                ).AddItem(
                    new MenuItemDefinition(
                        "Users",
                        L("Users"),
                        url: "#users",
                        icon: "fa fa-users",
                        requiredPermissionName: PermissionNames.PagesUsers
                        )
                ).AddItem(
                    new MenuItemDefinition(
                        "About",
                        new LocalizableString("About", EMRConsts.LocalizationSourceName),
                        url: "#/about",
                        icon: "fa fa-info"
                        )
                ).AddItem(
                    new MenuItemDefinition(
                        "Jobs",
                        new LocalizableString("Jobs", EMRConsts.LocalizationSourceName),
                        url: "#jobs",
                        icon: "fa fa-tasks",
                        requiredPermissionName: PermissionNames.PagesHostOnlyJobs
                        )
                );
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, EMRConsts.LocalizationSourceName);
        }
    }
}
