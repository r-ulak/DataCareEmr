using System;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using OpenQA.Selenium;

namespace EMR.FunctionalTests.PageObjects
{


    public class SearchResultPage : UiTestBasePage
    {
        public StartVisitPage StartVisitPage()
        {
            WaitForAngular();
            return Navigate.To<StartVisitPage>(By.XPath("(//button[@ng-disabled='!vm.createVisit'])[1]"), AjaxWaitTime);
        }


        public ReadOnlyCollection<IWebElement> ResultCount()
        {
            var results = Find.Element(By.Id("searchResult"), AjaxWaitTime)
                .FindElement(By.TagName("tbody"))
                .FindElements(By.TagName("tr"));

            return results;
        }
    }
}
