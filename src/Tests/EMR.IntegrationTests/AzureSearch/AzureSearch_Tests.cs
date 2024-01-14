using NUnit.Framework;
using System.Threading.Tasks;
using System.Collections.Generic;
using EMR.Entities;
using Ploeh.AutoFixture;
using Shouldly;
using System;
using EMR.Helper;
using Ploeh.AutoFixture.NUnit3;
using System.Linq;
using Abp.AutoMapper;
using Abp.Timing;
using Castle.Core.Internal;
using Emr.TestsCommon;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.Manager.Service.Internal;
using KellermanSoftware.CompareNetObjects;

namespace EMR.IntegrationTests
{
    [TestFixture]
    public class AzureSearch_Tests : EMRIntegrationTestBase
    {
        private IAzureRunSearch _azureRunSearch;

        [SetUp]
        public void SetUp()
        {
            base.EMRIntegrationTestBaseSetup();
            _azureRunSearch = Resolve<IAzureRunSearch>();
            LocalDBController.CreateData(LocalDBController.DbName, @"AbpSql\\AbpSettings.sql");
        }

        [TearDown]
        public void TestCleanup()
        {
            LocalDBController.TruncateData(LocalDBController.DbName,
                new string[] { "Immunizations", "ImmunizationCode", "CompletionStatusCode" });
        }
        [Test]
        [TestCase("Brain")]
        public async Task Search_Returns_Non_Null_Result(string term)
        {
            var result = await _azureRunSearch.SearchAsync<ICDCodePCSResultDto>(new DTO.Common.AzureSearchInputDto()
            {
                IndexName = EMRConsts.EMRAzureIndexNameICD10PCS,
                TenantId = 9,
                Term = term
            });

            result.Count(x => x.ICDCodePCSName.Contains(term)).ShouldBeGreaterThan(1);
        }
    }

}
