using System.Threading.Tasks;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DAL;
using EMR.FunctionalTests.Infrastructure;
using EMR.FunctionalTests.TestDataBuilder;
using EMR.Helper;
using EMR.IntegrationTests;
using EMR.Repository.DB.PatientData;
using EMR.Users;
using NUnit.Framework;
using Shouldly;
using TestStack.Dossier.Lists;

namespace EMR.FunctionalTests
{
    [TestFixture]
    public class SearchTest : EMRFunctionalTestBase
    {
        private IPatientDataRepositoryExtended _patientDataRepo;
       



        [SetUp]
        public void SetUp()
        {
            _patientDataRepo = Resolve<IPatientDataRepositoryExtended>();
        }

        private async Task SeedData()
        {
            var patients = PatientDataBuilder.CreateListOfSize(25)
                .TheFirst(10).WithFname("John")
                .TheNext(10).WithFname("Chris")
                .All().WithTenantId(base.TenantId)
                .BuildList();
            await patients.ForEachAsync(
                async item => { await _patientDataRepo.InsertAsync(item); });
 
        }

        [TearDown]
        public async Task TearDown()
        {
            SqlExpressDbController.TruncateData(SqlExpressDbController.DbName, new string[] {
                "PatientData",
                "VisitCode",
                "AdministrationSite" });
        }

        [Test]
        [TestCase("John", 10)]
        [TestCase("Chris", 10)]
        [TestCase("", 0)]
        [TestCase("Nepal", 0)]
        public async Task User_Can_Login_Sucessfully_With_Correct_Credentials(string term, int expectedCount)
        {
            //Arrange
            await SeedData();
            //Act
            var count = Navigation
                .Login()
                .SearchByTerm(term)
                .ResultCount().Count;

            //Assert
            count.ShouldBe(expectedCount);
        }
    }
}
