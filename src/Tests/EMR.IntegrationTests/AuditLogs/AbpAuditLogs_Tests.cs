using NUnit.Framework;
using System.Threading.Tasks;
using EMR.DAL;
using System.Collections.Generic;
using EMR.AbpAuditLogsService;
using EMR.Entities;
using Ploeh.AutoFixture;
using Shouldly;
using System;
using EMR.Helper;
using Ploeh.AutoFixture.Kernel;
using Ploeh.AutoFixture.NUnit3;
using System.Linq;
using Abp.Configuration;
using Emr.TestsCommon;
using EMR.Configuration;
using EMR.DTO.AuditLog;

namespace EMR.IntegrationTests
{
    [TestFixture]
    public class AbpAuditLogs_Tests : EMRIntegrationTestBase
    {
        private IAbpAuditLogsAppService _abpAbpAuditLogsService;
        private IAbpAuditLogsRepositoryExtended _abpAbpAuditLogsRepo;
        private IAbpUsersRepositoryExtended _abpUserRepo;
        private ISettingManager _settingManager;
        private Random rand;
        [SetUp]
        public void SetUp()
        {
            base.EMRIntegrationTestBaseSetup();
            SetupConnection();
            _abpAbpAuditLogsService = Resolve<IAbpAuditLogsAppService>();
            _abpAbpAuditLogsRepo = Resolve<IAbpAuditLogsRepositoryExtended>();
            _abpUserRepo = Resolve<IAbpUsersRepositoryExtended>();
            _settingManager = Resolve<ISettingManager>();
            rand = new Random();

        }

        public void SetupConnection()
        {

        }
        [TearDown]
        public void TestCleanup()
        {
            LocalDBController.TruncateData(LocalDBController.DbName, new string[] { "AbpAuditLogs" });
        }

        private DateTime GetRandomDate(DateTime startDate, DateTime endDate)
        {
            //get randomDate between two Dates
            TimeSpan timeSpan = endDate - startDate;
            var randomTest = new Random();
            TimeSpan newSpan = new TimeSpan(0, randomTest.Next(0, (int)timeSpan.TotalMinutes), 0);
            return startDate + newSpan;
        }
        private async Task<List<AbpAuditLogs>> CreateAuditLogs(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var auditlogs = generator.Take(30).ToList();
            var logs = auditlogs.Take(5).Select(x => { x.TenantId = 1; x.UserId = rand.Next(1, 51); return x; }).ToList();
            logs.AddRange(auditlogs.Skip(5));
            await abpUsers.Take(50).ToList().ForEachAsync(async item =>
            {
                item.TenantId = 1;
                await _abpUserRepo.InsertAsync(item);
            });
            await logs.ForEachAsync(async item => await _abpAbpAuditLogsRepo.InsertAsync(item));
            return logs;
        }

        [Test, AutoData]
        public async Task Should_Filter_By_Date_Range_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var startDate = new DateTime(2015, 1, 1);
            var endDate = new DateTime(2018, 1, 1);
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].ExecutionTime = GetRandomDate(startDate, endDate);
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.ExecutionTime >= startDate && x.ExecutionTime <= endDate && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      DateFilter = true,
                      DateRange = new DTO.Common.DateRangeDto()
                      {
                          StartDate = startDate,
                          EndDate = endDate,
                      },
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }



        [Test, AutoData]
        public async Task Should_Filter_By_Invaid_Username_With_No_Result(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].UserId = 1;
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      UserIdFilter = true,
                      UserName = "invalid"
                  });
            //Assert
            result.Count.ShouldBe(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Filter_By_Username_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].UserId = 1;
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.UserId == 1 && x.TenantId == 1);
            var user = (await _abpUserRepo.GetByIdAsync(1, 1));
            //Act
            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      UserIdFilter = true,
                      UserName = user.UserName
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }


        [Test, AutoData]
        public async Task Should_Filter_By_UserNameNot_UserId_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].UserId = 1;
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      UserIdFilter = true,
                      UserId = 1
                  });
            //Assert
            result.Count.ShouldBe(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Filter_By_ServiceName_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].ServiceName = "Service";
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.ServiceName == "Service" && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      ServiceNameFilter = true,
                      ServiceName = "service"
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Filter_By_MethodName_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].MethodName = "MethodName1";
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.MethodName == "MethodName1" && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      MethodNameFilter = true,
                      MethodName = "methodName1"
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Filter_By_BrowserInfo_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].BrowserInfo = "BrowserInfo1";
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.BrowserInfo == "BrowserInfo1" && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      BrowserInfoFilter = true,
                      BrowserInfo = "browserinfo1"
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Filter_By_ErrorState_With_Exception_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].Exception = null;
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.Exception != null && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      ErrorStateFilter = true,
                      ErrorState = true
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Filter_By_ErrorState_With_NoException_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].Exception = null;
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.Exception == null && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      ErrorStateFilter = true,
                      ErrorState = false
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }


        [Test, AutoData]
        public async Task Should_Filter_By_ExecutionTimeDuration_Range_Only(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].ExecutionDuration = rand.Next(20, 1001);
            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);
            var expectedCount = logs.Count(x => x.ExecutionDuration >= 20 && x.ExecutionDuration <= 1000
            && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      ExecutionDurationFilter = true,
                      ExecutionDurationMin = 20,
                      ExecutionDurationMax = 1000
                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Get_Paged_Result(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var logs = generator.Take(130)
                .Select(x => { x.TenantId = 1; x.UserId = rand.Next(1, 51); return x; })
                .ToList();
            await abpUsers.Take(50).ToList().ForEachAsync(async item =>
            {
                item.TenantId = 1;
                await _abpUserRepo.InsertAsync(item);
            });
            await logs.ForEachAsync(async item => await _abpAbpAuditLogsRepo.InsertAsync(item));

            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      Offset = 20,
                  });
            //Assert
            result.Count(x => x.Id > 20).ShouldBe(_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));
            result.Count.ShouldBe
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

        [Test, AutoData]
        public async Task Should_Filter_By_ExecutionTimeDuration_Date_ServiceName_ErrorState(Generator<AbpAuditLogs> generator, Generator<AbpUsers> abpUsers)
        {
            var startDate = new DateTime(2015, 1, 1);
            var endDate = new DateTime(2018, 1, 1);

            var logs = await CreateAuditLogs(generator, abpUsers);
            logs[2].ExecutionDuration = rand.Next(20, 1001);
            logs[2].ExecutionTime = GetRandomDate(startDate, endDate);
            logs[2].ServiceName = "Service";
            logs[2].Exception = null;

            logs[2].Id = 3;

            await _abpAbpAuditLogsRepo.UpdateAsync(logs[2]);

            var expectedCount = logs.Count(x => x.ExecutionTime >= startDate && x.ExecutionTime <= endDate &&
                                         x.ServiceName == "Service"
                                         && x.Exception == null
                                         && x.ExecutionDuration >= 20 && x.ExecutionDuration <= 1000
                                         && x.TenantId == 1);
            //Act

            var result = await _abpAbpAuditLogsService.GetAuditLogsByFilter
                  (new AuditLogInputDto()
                  {
                      ExecutionDurationFilter = true,
                      ExecutionDurationMin = 20,
                      ExecutionDurationMax = 1000,
                      DateFilter = true,
                      DateRange = new DTO.Common.DateRangeDto()
                      {
                          StartDate = startDate,
                          EndDate = endDate,
                      },
                      ServiceNameFilter = true,
                      ServiceName = "service",
                      ErrorStateFilter = true,
                      ErrorState = false

                  });
            //Assert
            result.Count.ShouldBe(expectedCount);
            expectedCount.ShouldBeGreaterThan(0);
            result.Count.ShouldBeLessThanOrEqualTo
                (_settingManager.GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize));

        }

    }
}
