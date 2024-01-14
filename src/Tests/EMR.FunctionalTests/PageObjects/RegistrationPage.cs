using OpenQA.Selenium;

namespace EMR.FunctionalTests.PageObjects
{


    public class RegistrationPage : UiTestBasePage
    {
        public string GetFirstName()
        {
            WaitForAngular();
            return Find.Element(By.XPath("(//input[@ng-model='vm.patientdata.fname'])"), AjaxWaitTime).Text;
        }
    }
}
