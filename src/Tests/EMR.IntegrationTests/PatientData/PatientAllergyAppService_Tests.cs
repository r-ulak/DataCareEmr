using Abp.Runtime.Session;
using EMR.Configuration;
using EMR.DAL;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DataAccess.Infrastructure.Database.Implementation;
using EMR.DTO.PatientSearch.Dto;
using EMR.Manager.Service;
using EMR.PatientAllergyService;
using EMR.Redis;
using NUnit.Framework;
using Rhino.Mocks;
using Shouldly;
using System;
using System.Data.Entity;
using System.Threading.Tasks;
using Emr.TestsCommon;

namespace EMR.IntegrationTests
{
    [TestFixture]
    public class PatientAllergyAppService_Tests : EMRIntegrationTestBase
    {
        private IProcExecutor _procExecutor;
        private IPatientAllergyRepositoryExtended _patientAllergyRepo;

        private IAllergyReactionCodeRepository _allergyReactionCodeRepository;
        private IAllergyCodeRepository _allergyCodeRepository;
        private IAllergySeverityCodeRepository _allergySeverityCodeRepository;
        private IAllergyTypeCodeRepository _allergyTypeCodeRepository;
        private IAllergyCategoryCodeRepository _allergyCategoryCodeRepository;
        private IRedisCacheStore _cacheStore;


        private IPatientAllergyManager _patientAllergyManager;
        private IPatientAllergyAppService _patientAllergyService;
        private IAppConfigSqlConnection _connection;
        [SetUp]
        public void SetUp()
        {
            base.EMRIntegrationTestBaseSetup();
            _connection = MockRepository.GenerateMock<IAppConfigSqlConnection>();
            _connection.Stub(x => x.GetConnection()).Return(LocalDBController.GetLocalDbConnection(LocalDBController.DbName));
            _procExecutor = MockRepository.GeneratePartialMock<ProcExecutor>(_connection);
            _patientAllergyRepo = MockRepository.GeneratePartialMock<PatientAllergyRepositoryExtended>(_procExecutor);

            _allergyReactionCodeRepository = MockRepository.GeneratePartialMock<AllergyReactionCodeRepository>(_procExecutor);
            _allergyCodeRepository = MockRepository.GeneratePartialMock<AllergyCodeRepository>(_procExecutor);
            _allergySeverityCodeRepository = MockRepository.GeneratePartialMock<AllergySeverityCodeRepository>(_procExecutor);
            _allergyTypeCodeRepository = MockRepository.GeneratePartialMock<AllergyTypeCodeRepository>(_procExecutor);
            _allergyCategoryCodeRepository = MockRepository.GeneratePartialMock<AllergyCategoryCodeRepository>(_procExecutor);
            _cacheStore = MockRepository.GenerateMock<IRedisCacheStore>();


            _patientAllergyManager = MockRepository.GeneratePartialMock<PatientAllergyManager>(_patientAllergyRepo,
                      _cacheStore,
             _allergyReactionCodeRepository,
                _allergyCodeRepository,
             _allergySeverityCodeRepository,
             _allergyTypeCodeRepository,
             _allergyCategoryCodeRepository

                );
            _patientAllergyService = MockRepository.GeneratePartialMock<PatientAllergyAppService>(_patientAllergyManager);



        }

        [TearDown]
        public void ClassEndCleanup()
        {
        }

        [Test]
        public async Task Should_Insert_PatentAllergy_To_Table()
        {
            //Arrange
            _patientAllergyService.Stub(x => x.GetTenantId()).Return(AbpSession.GetTenantId());
            _patientAllergyService.Stub(x => x.GetLoggedUserId()).Return(AbpSession.GetUserId());

            //Act
            CreatePatientAllergyInputDto createInput = new CreatePatientAllergyInputDto
            {
                Provider = 100,
                AllergyCategoryCodeId = 1,
                AllergyName = "Allergy1",
                AllergyTypeId = 1,
                Dob = DateTime.Now,
                Note = "Test Notes",
                Pid = 100,
                ReactionName = "Reaction1",
                SeverityId = 1,
                StartDate = DateTime.Now,
                Status = "active",
                TenantId = 1

            };

            var id = await _patientAllergyService.CreateAllergy(createInput);

            //Assert
            _connection.Stub(x => x.GetConnection()).Return(LocalDBController.GetLocalDbConnection(LocalDBController.DbName));
            _patientAllergyRepo = Resolve<IPatientAllergyRepositoryExtended>();

            var patientAllergy = await _patientAllergyRepo.GetByPatientAllergyIdAsync(id, 1);
            patientAllergy.Provider.ShouldBe(AbpSession.GetUserId());
            patientAllergy.CreatedBy.ShouldBe(AbpSession.GetUserId());
            patientAllergy.AllergyName.ShouldBe("Allergy1");

        }
    }
}
