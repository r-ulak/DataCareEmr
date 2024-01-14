using System.Threading;
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
using Ploeh.AutoFixture;
using Rhino.Mocks.Expectations;
using Shouldly;
using TestStack.Dossier.Lists;
namespace EMR.FunctionalTests
{


    [TestFixture]
    public class StartVisitTest : EMRFunctionalTestBase
    {
        private IPatientDataRepositoryExtended _patientDataRepo;
        private IAdministrationSiteRepository _administrationSiteRepository;
        private IVisitCodeRepository _visitCodeRepository;
        [SetUp]
        public void SetUp()
        {
            _patientDataRepo = Resolve<IPatientDataRepositoryExtended>();
            _administrationSiteRepository = Resolve<IAdministrationSiteRepository>();
            _visitCodeRepository = Resolve<IVisitCodeRepository>();
        }

        private async Task SeedData()
        {
            var patients = PatientDataBuilder.CreateListOfSize(25)
          .TheFirst(10).WithFname("John")
          .TheNext(10).WithFname("Chris")
          .TheNext(5).WithFname("Pamela")
          .All().WithTenantId(base.TenantId)
          .All().WithCurrentlyInVisit(false)

          .BuildList();
            await patients.ForEachAsync(
                  async item =>
                  {
                      await _patientDataRepo.InsertAsync(item);
                  });

            var administrationSite = AdministrationSiteBuilder.CreateListOfSize(10)
     .TheFirst(5).WithTenantId(base.TenantId).BuildList();
            await administrationSite.ForEachAsync(
                async item => { await _administrationSiteRepository.InsertAsync(item); });

            var visitType = VisitCodeBuilder.CreateListOfSize(10)
                .TheFirst(5).BuildList();
            await visitType.ForEachAsync(
                async item => { await _visitCodeRepository.InsertAsync(item); });
        }

        [TearDown]
        public void TearDown()
        {
            SqlExpressDbController.TruncateData(SqlExpressDbController.DbName, new string[] {
                "PatientData",
                "VisitCode",
                "AdministrationSite" });
        }

        [Test]
        [TestCase("John", 1, 1, 3, 1)]
        [TestCase("Pamela", 2, 2, 3, 2)]
        [TestCase("Chris", 1, 2, 1, 1)]
        public async Task Start_Visit_With_Diffrent_VisitType_AdministrationSiteId_DoctorId_NurseId(
            string term,
            int visitTypeId,
            int administrationSiteId,
            int doctorId,
            int nurseId)
        {
            //Arrange
            await SeedData();
            var startErrorCount = await GetErrorCountAsync();
            //Act
            var visitPage = Navigation
                .Login()
                .SearchByTerm(term)
                .StartVisitPage();
            visitPage.AdministrationSiteId = administrationSiteId;
            visitPage.VisitTypeId = visitTypeId;
            visitPage.VisitingDoctorId = doctorId;
            visitPage.AssignedNurseId = nurseId;
            visitPage.ReasonForVisit = fixture.Create<string>();
            var fname = visitPage.AddVisit().GetFirstName();
            //Assert
            await CheckNewErrors(startErrorCount, await GetErrorCountAsync());
            fname.ShouldBe(term);

        }
    }
}
