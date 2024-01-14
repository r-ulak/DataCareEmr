using NUnit.Framework;
using System;
using EMR.FunctionalTests.Infrastructure;
using EMR.IntegrationTests;

namespace EMR.FunctionalTests
{
    [SetUpFixture]
    public class SetupTearDownDb:EMRFunctionalTestBase
    {
        [OneTimeSetUp]
        public void BuildDB()
        {
            Environment.CurrentDirectory = TestContext.CurrentContext.TestDirectory;

            // or
            SqlExpressDbController.Start(SqlExpressDbController.DbName);
            SqlExpressDbController.CreateTables(SqlExpressDbController.DbName, Environment.CurrentDirectory + @"\\..\\..\\..\\..\\Tests\\EMR.IntegrationTests\\SQL\\Create\\");
            SqlExpressDbController.ApplySproc(SqlExpressDbController.DbName, Environment.CurrentDirectory + @"\\..\\..\\..\\..\\Tests\\EMR.IntegrationTests\\SQL\\Sproc\\");
            base.EMRIntegrationTestBaseSetup();

        }

        [OneTimeTearDown]
        public void TearDownDB()
        {
            SqlExpressDbController.End(SqlExpressDbController.DbName);

        }
    }
}
