using NUnit.Framework;
using System.Threading.Tasks;
using EMR.DAL;
using System.Collections.Generic;
using EMR.Entities;
using Ploeh.AutoFixture;
using Shouldly;
using System;
using EMR.Helper;
using Ploeh.AutoFixture.NUnit3;
using System.Linq;
using Abp.AutoMapper;
using Abp.Configuration;
using Abp.Timing;
using Castle.Core.Internal;
using Emr.TestsCommon;
using EMR.Configuration;
using EMR.DTO;
using EMR.DTO.AuditLog;
using EMR.DTO.PatientSearch.Dto;
using EMR.Immunizations;
using KellermanSoftware.CompareNetObjects;

namespace EMR.IntegrationTests
{
    [TestFixture]
    public class PatientImmunizationTests : EMRIntegrationTestBase
    {
        private IImmunizationsAppService _immunizationsService;
        private IImmunizationsRepositoryExtended _immunizationsRepo;
        private ICompletionStatusCodeRepository _completionStatusCodeRepository;
        private IImmunizationCodeRepository _immunizationCodeRepository;
        private Random _rand;

        [SetUp]
        public void SetUp()
        {
            base.EMRIntegrationTestBaseSetup();
            SetupConnection();
            _immunizationsService = Resolve<IImmunizationsAppService>();
            _immunizationsRepo = Resolve<IImmunizationsRepositoryExtended>();
            _completionStatusCodeRepository = Resolve<ICompletionStatusCodeRepository>();
            _immunizationCodeRepository = Resolve<IImmunizationCodeRepository>();
            _rand = new Random();

        }

        public void SetupConnection()
        {

        }

        [TearDown]
        public void TestCleanup()
        {
            LocalDBController.TruncateData(LocalDBController.DbName,
                new string[] { "Immunizations", "ImmunizationCode", "CompletionStatusCode" });
        }

        private async Task<List<Entities.Immunizations>> SeedData(IEnumerable<Entities.Immunizations> immunization,
            IEnumerable<CompletionStatusCode> completionCode, IEnumerable<ImmunizationCode> immCode)
        {
            var immList = immunization.Take(300)
                .Select(x =>
                {
                    x.CompletionStatusCodeId = _rand.Next(1, 4);
                    x.ImmunizationCodeId = _rand.Next(1, 30);
                    return x;
                })
                .ToList();
            var immListTable = immList.Take(5).Select(x =>
            {
                x.TenantId = 1;
                x.Pid = 10;
                return x;
            }).ToList();
            immListTable.AddRange(immList.Skip(5));
            var identity = 1;
            await completionCode.Take(3).ToList().ForEachAsync(async item =>
            {
                item.CompletionStatusCodeId = identity++;
                await _completionStatusCodeRepository.InsertAsync(item);
            });
            identity = 1;
            await immCode.Take(30).ToList().ForEachAsync(async item =>
            {
                item.ImmunizationCodeId = identity++;
                await _immunizationCodeRepository.InsertAsync(item);
            });
            await immListTable.ForEachAsync(async item => await _immunizationsRepo.InsertAsync(item));
            return immListTable;
        }

        [Test, AutoData]
        public async Task Should_Filter_By_TenantId_And_Pid(Generator<Entities.Immunizations> immunization,
            Generator<CompletionStatusCode> completionCode, Generator<ImmunizationCode> immCode)
        {
            await SeedData(immunization, completionCode, immCode);
            //Act
            var result = await _immunizationsService.GetImmunizationDetailByPid
            (new PatientDataInputDto()
            {
                PatientId = 10
            });
            //Assert
            result.Count.ShouldBe(5);
        }

        [Test, AutoData]
        public async Task Should_Return_Not_Null_Value(Generator<Entities.Immunizations> immunization,
            Generator<CompletionStatusCode> completionCode, Generator<ImmunizationCode> immCode)
        {
            await SeedData(immunization, completionCode, immCode);
            //Act
            var result = await _immunizationsService.GetImmunizationDetailByPid
            (new PatientDataInputDto()
            {
                PatientId = 0
            });
            //Assert
            result.Count.ShouldBe(0);
            result.ShouldBeOfType<List<ImmunizationsResultDto>>();
        }

        [Test, AutoData]
        public async Task Should_Create_Immunizations_Records(Generator<CreateUpdateImmunizationsDto> immunization)
        {
            //Arrange

            //Act
            var results = new List<long>();
            var generatedRecords = immunization.Take(10).ToList();
            await generatedRecords.ForEachAsync(async item =>
            {
                item.TenantId = 1;
                item.Status = "active";
                item.AdministeredDate = item.AdministeredDate > DateTime.Today
                    ? DateTime.Today.AddYears(-1)
                    : item.AdministeredDate;
                item.Dob = item.AdministeredDate.AddYears(-10);
                results.Add(await _immunizationsService.CreateImmunization(item));
            });
            //Assert
            results.Count.ShouldBe(10);
            var records = new List<Entities.Immunizations>();
            await results.ForEachAsync(async item =>
            {
                records.Add(await _immunizationsRepo.GetByIdAsync(item, 1));
            });
            var compareLogic = new CompareLogic()
            {
                Config = new ComparisonConfig()
                {
                    MembersToIgnore = new List<string>() { "Id", "AdministeredDate", "VisitDate", "CreateDate", "UpdateDate" },
                    MaxDifferences = 40,
                }
            };

            var index = 0;
            records.OrderBy(y => y.Id).ForEach(item =>
            {
                item.CreatedBy.ShouldBe(2);
                var compareResult = compareLogic.Compare(item, generatedRecords[index++].MapTo<Entities.Immunizations>());
                Console.WriteLine(compareResult.DifferencesString);
                compareResult.AreEqual.ShouldBe(true);
            });
        }

        [Test, AutoData]
        public async Task Should_Update_Immunizations_Records(Generator<Entities.Immunizations> immunization,
            Generator<CompletionStatusCode> completionCode, Generator<ImmunizationCode> immCode)
        {
            await SeedData(immunization, completionCode, immCode);
            var records = new List<Entities.Immunizations>();
            var results = new List<long>() { 1, 2, 3, 4 };
            await results.ForEachAsync(async item =>
            {

                records.Add(await _immunizationsRepo.GetByIdAsync(item, 1));
            });

            //Act
            await records.ForEachAsync(async item =>
            {
                item.CompletionStatusCodeId = 10;
                item.InformationSource = "Source1";
                item.Note = "Note";
                item.Status = "active";
                item.AdministeredDate = item.AdministeredDate > DateTime.Today
                    ? DateTime.Today.AddYears(-1)
                    : item.AdministeredDate;
                await _immunizationsService.UpdateImmunization(item.MapTo<CreateUpdateImmunizationsDto>());
            });

            //Assert
            await results.ForEachAsync(async item =>
            {
                var result = await _immunizationsRepo.GetByIdAsync(item, 1);
                result.CompletionStatusCodeId.ShouldBe(10);
                result.InformationSource.ShouldBe("Source1");
                result.UpdatedBy.ShouldBe(2);
                result.UpdateDate.Value.Date.ShouldBe(Clock.Now.Date);
                result.Note.ShouldBe("Note");
            });

        }

    }

}
