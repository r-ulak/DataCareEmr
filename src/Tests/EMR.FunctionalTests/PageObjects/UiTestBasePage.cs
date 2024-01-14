using System;
using System.Threading;
using TestStack.Seleno.PageObjects;

namespace EMR.FunctionalTests.PageObjects
{


    public class UiTestBasePage : Page
    {
        public TimeSpan AjaxWaitTime => new TimeSpan(0, 0, 60);

        protected void WaitForAngular()
        {
            Thread.Sleep(2000);
        }
    }
}
