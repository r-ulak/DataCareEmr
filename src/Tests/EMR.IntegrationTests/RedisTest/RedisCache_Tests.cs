using Abp.Dependency;
using Abp.TestBase;
using EMR.Redis;
using NUnit.Framework;
using Rhino.Mocks;
using Shouldly;
using System;

namespace EMR.IntegrationTests.RedisTest
{
    public class RedisCache_Tests: EMRIntegrationTestBase
    {
        private IRedisCacheStore _cacheStore;
        [SetUp]
        public void Setup()
        {
            _cacheStore = LocalIocManager.Resolve<IRedisCacheStore>();
        }

        [Test]
        public void CacheValue_Must_Be_Set_And_Sucessfully_Retrived()
        {
            var result = _cacheStore.Get("cacheKey", new TimeSpan(0, 0, 30),
                 () => FakeDbCall());

            result.ShouldBe("SpecialData");
            _cacheStore.Get<string>("cacheKey").ShouldBe(result);
        }

        private string FakeDbCall()
        {
            return "SpecialData";
        }
    }
}
