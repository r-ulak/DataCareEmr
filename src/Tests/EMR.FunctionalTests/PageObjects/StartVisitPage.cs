using System.Diagnostics;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using TestStack.Seleno.PageObjects;

namespace EMR.FunctionalTests.PageObjects
{


    public class StartVisitPage : UiTestBasePage
    {
        public string ReasonForVisit
        {
            set
            {
                Execute.ActionOnLocator(By.XPath("//textarea[@ng-model='vm.visit.reason']"), e =>
                {
                    e.Clear();
                    e.SendKeys(value);
                }, AjaxWaitTime);
            }
        }

        public int VisitTypeId
        {
            set
            {
                Execute.ActionOnLocator(By.XPath("//select[@ng-model='vm.visit.visitCodeId']"), e =>
                {
                    var selectElement = new SelectElement(e);
                    selectElement.SelectByIndex(value);
                }, AjaxWaitTime);
            }
        }

        public int AdministrationSiteId
        {
            set
            {
                Execute.ActionOnLocator(By.XPath("//select[@ng-model='vm.visit.administrationSiteId']"), e =>
                {
                    var selectElement = new SelectElement(e);
                    selectElement.SelectByIndex(value);
                }, AjaxWaitTime);
            }
        }

        public int VisitingDoctorId
        {
            set
            {
                Execute.ActionOnLocator(By.XPath("//select[@ng-model='vm.visit.doctorId']"), e =>
                {
                    var selectElement = new SelectElement(e);
                    selectElement.SelectByIndex(value);
                }, AjaxWaitTime);
            }
        }

        public int AssignedNurseId
        {
            set
            {
                Debug.WriteLine("Line64");
                Execute.ActionOnLocator(By.XPath("//select[@ng-model='vm.visit.nurseId']"), e =>
                {
                    var selectElement = new SelectElement(e);
                    selectElement.SelectByIndex(value);
                }, AjaxWaitTime);
            }
        }

        public RegistrationPage AddVisit()
        {
            return Navigate.To<RegistrationPage>(By.Id("addVisit"));
        }

    }
}
