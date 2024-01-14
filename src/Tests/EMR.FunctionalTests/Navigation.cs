using EMR.FunctionalTests.Infrastructure;
using EMR.FunctionalTests.PageObjects;

namespace EMR.FunctionalTests
{
    public static class Navigation
    {

        public static LoginPage GotoLoginPage()
        {
            return IISExpressHost.Instance.NavigateToInitialPage<LoginPage>("/Account/Login");
        }


        public static SearchViewPage Login()
        {
            var loginPage = Navigation.GotoLoginPage();

            loginPage.TenancyName = "Hospital9";
            loginPage.Password = "123qwe";
            loginPage.UsernameOrEmailAddress = "admin";
            return loginPage.SubmitLoginPage();
        }
    }
}
