using System.Collections.ObjectModel;
using OpenQA.Selenium;

namespace EMR.FunctionalTests.PageObjects
{
    public class SearchViewPage : UiTestBasePage
    {

        public bool SearchInputExists()
        {
            return Find.Element(By.Id("searchByPatient"), AjaxWaitTime).Displayed;
        }

        public SearchResultPage SearchByTerm(string term)
        {
            Find.Element(By.Id("searchByPatient"), AjaxWaitTime).SendKeys(term);
            return Navigate.To<SearchResultPage>(By.Id("searchGo"), AjaxWaitTime);
        }


    }
}
