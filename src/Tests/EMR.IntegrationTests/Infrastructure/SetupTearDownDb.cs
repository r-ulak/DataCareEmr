using NUnit.Framework;
using System;
using Emr.TestsCommon;

namespace EMR.IntegrationTests
{
    [SetUpFixture]
    public class SetupTearDownDb
    {
        [OneTimeSetUp]
        public void BuildDB()
        {
            Environment.CurrentDirectory = TestContext.CurrentContext.TestDirectory;

            LocalDBController.Start(LocalDBController.DbName);
            LocalDBController.CreateTables(LocalDBController.DbName, Environment.CurrentDirectory + @"\\SQL\\Create\\");
            LocalDBController.ApplySproc(LocalDBController.DbName, @"SQL\\Sproc\\");
            LocalDBController.CreateData(LocalDBController.DbName, Environment.CurrentDirectory + @"\\AbpSql\\AbpCreateTable.sql");

        }

        [OneTimeTearDown]
        public void TearDownDB()
        {
            LocalDBController.End(LocalDBController.DbName);

        }
    }
}
