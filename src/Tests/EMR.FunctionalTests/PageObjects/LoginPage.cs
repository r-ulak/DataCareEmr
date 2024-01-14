using EMR.FunctionalTests.Infrastructure;
using OpenQA.Selenium;
using TestStack.Seleno.PageObjects;

namespace EMR.FunctionalTests.PageObjects
{


    public class LoginPage : UiTestBasePage
    {
        public string TenancyName { set { Execute.ActionOnLocator(By.Id("TenancyName"), e => { e.Clear(); e.SendKeys(value); }); } }
        public string UsernameOrEmailAddress { set { Execute.ActionOnLocator(By.Id("EmailAddressInput"), e => { e.Clear(); e.SendKeys(value); }); } }
        public string Password { set { Execute.ActionOnLocator(By.Id("PasswordInput"), e => { e.Clear(); e.SendKeys(value); }); } }


        public SearchViewPage SubmitLoginPage()
        {
            return Navigate.To<SearchViewPage>(By.Id("LoginButton"));
        }

    }
}
