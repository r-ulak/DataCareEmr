using Abp.AutoMapper;
using Abp.Runtime.Session;
using EMR.Configuration;
using EMR.DAL;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DataAccess.Infrastructure.Database.Implementation;
using EMR.DTO.PatientSearch.Dto;
using EMR.Manager.Service;
using EMR.PatientData;
using EMR.Repository.DB.PatientData;
using NUnit.Framework;
using Ploeh.AutoFixture;
using Ploeh.AutoFixture.NUnit3;
using Rhino.Mocks;
using Shouldly;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Emr.TestsCommon;

namespace EMR.IntegrationTests
{
    [TestFixture]
    public class PatientDataAppService_Tests : EMRIntegrationTestBase
    {
        private IProcExecutor _procExecutor;
        private IPatientDataRepositoryExtended _patientDataRepo;
        private IPatientDataRepositoryExtended _patientDataRepoex;
        private IPatientDataManager _patientDataManager;
        private PatientDataAppService _patientDataService;
        private IPatientDataAppService _patientDataServiceIoc;
        private IAppConfigSqlConnection _connection;
        [SetUp]
        public void SetUp()
        {
            base.EMRIntegrationTestBaseSetup();
            _connection = MockRepository.GenerateMock<IAppConfigSqlConnection>();
            _connection.Stub(x => x.GetConnection()).Return(LocalDBController.GetLocalDbConnection(LocalDBController.DbName));
            _procExecutor = MockRepository.GeneratePartialMock<ProcExecutor>(_connection);
            _patientDataRepo = MockRepository.GeneratePartialMock<PatientDataRepositoryExtended>(_procExecutor);
            _patientDataRepoex = Resolve<IPatientDataRepositoryExtended>();
            _patientDataManager = MockRepository.GeneratePartialMock<PatientDataManager>(_patientDataRepo);
            _patientDataService = MockRepository.GeneratePartialMock<PatientDataAppService>(_patientDataManager);


        }

        [TearDown]
        public void ClassEndCleanup()
        {
        }

        private async Task CreatePatientData(Generator<Entities.PatientData> generator)
        {
            var patientData = generator.Take(30).ToList();
            var logs = patientData.Take(3).Select(x =>
            {
                x.TenantId = 1;
                x.Fname = "Bruce"; return x;
            }).ToList();
            logs.AddRange(patientData.Skip(5));
            foreach (var item in logs)
            {
                await _patientDataRepoex.InsertAsync(item);
            }
        }

        [Test]
        public async Task Should_Insert_PatentData_To_Table()
        {
            //Arrange
            _patientDataService.Stub(x => x.GetTenantId()).Return(AbpSession.GetTenantId());

            //Act
            PatientDataDto createInput = new PatientDataDto
            {
                Fname = "Alex",
                Lname = "Abrines",
                Mname = string.Empty,
                DOB = DateTime.MaxValue,
                CountryCode = "US",
                Email = "email@email.com",
                Race = "Tem",
                Street = string.Empty,
                PostalCode = string.Empty,
                City = string.Empty,
                State = string.Empty,
                DriversLicense = string.Empty,
                IdentificationNumber = string.Empty,
                PhoneHome = string.Empty,
                EmergencyContactPhone = string.Empty,
                EmergencyContactName = string.Empty,
                PhoneCell = string.Empty,
                ContactRelationship = string.Empty,
                Gender = string.Empty,
                Ethnicity = string.Empty,
                DeceasedReason = string.Empty,
                County = string.Empty,
                TenantId = 1

            };

            var id = await _patientDataService.Create(createInput);

            //Assert
            _patientDataRepo = Resolve<IPatientDataRepositoryExtended>();
            var alexuser = await _patientDataRepo.GetByPidAsync(id, 1);
            alexuser.Email.ShouldBe("email@email.com");
            alexuser.Fname.ShouldBe("Alex");




        }

        [Test, AutoData]
        public async Task Should_Filter_By_Name_From_PatientData_Table(Generator<Entities.PatientData> generator)
        {
            //Arrange]
            await CreatePatientData(generator);
            _patientDataService.Stub(x => x.GetTenantId()).Return(AbpSession.GetTenantId());
            _patientDataService.Stub(x => x.GetSettingValue<int>(EMRSettingNames.PatientSearchResultPageSize)).Return(10);


            PatientSearchInputDto searchInput = new PatientSearchInputDto
            {
                QueryTerm = "Bruce",
                PageSize = 10,
                SkipCount = 1
            };
            //Act
            var patient = await _patientDataService.GetSearchResult(searchInput);

            //Assert
            patient.Items.Count.ShouldBe(2);
        }


        [Test, AutoData]
        public async Task Should_Update_PatientData_Table(Generator<Entities.PatientData> generator)
        {
            //Arrange]
            await CreatePatientData(generator);
            _patientDataServiceIoc = Resolve<IPatientDataAppService>();

            PatientDataInputDto input = new PatientDataInputDto
            {
                PatientId = 1,
                TenantId = 1
            };
            var patient = await _patientDataServiceIoc.GetPatientData(input);
            //Act
            patient.Fname = "God";
            patient.DOB = new DateTime(2001, 1, 1);
            var updateinput = patient.MapTo<PatientDataDto>();
            updateinput.Pid = 1;
            await _patientDataServiceIoc.UpdatePatient(updateinput);


            //Assert

            var result = await _patientDataServiceIoc.GetSearchResult(new PatientSearchInputDto()
            {
                QueryTerm = "God",
                SkipCount = 0
            });
            result.Items.Count.ShouldBe(1);
            result.Items.Count(x => x.DOB == new DateTime(2001, 1, 1)).ShouldBe(1);
        }
    }
}
