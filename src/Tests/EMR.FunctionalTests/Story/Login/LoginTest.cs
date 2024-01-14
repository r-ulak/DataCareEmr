using EMR.IntegrationTests;
using NUnit.Framework;
using Shouldly;

namespace EMR.FunctionalTests.Story.Login
{
    [TestFixture]
    public class LoginTest : EMRFunctionalTestBase
    {

        [SetUp]
        public void SetUp()
        {
        }

        [Test]
        public void User_Can_Login_Sucessfully_With_Correct_Credentials()
        {

            var loginPage = Navigation.GotoLoginPage();
            loginPage.TenancyName = "Hospital" + base.TenantId;
            loginPage.Password = "123qwe";
            loginPage.UsernameOrEmailAddress = "admin";
            loginPage.SubmitLoginPage().SearchInputExists().ShouldBe(true);

        }
    }
}
