using EMR.Entities;
using Ploeh.AutoFixture;
using Ploeh.AutoFixture.Kernel;
using Ploeh.AutoFixture.NUnit3;

namespace EMR.IntegrationTests
{
    internal class AbpAuditLogDataAttribute : AutoDataAttribute
    {
        internal AbpAuditLogDataAttribute()
            : base(
                new Fixture().Customize(
                    new CompositeCustomization(
                        new MyCustomization())))
        {
        }

        private class MyCustomization : ICustomization
        {
            public void Customize(IFixture fixture)
            {
                fixture.Customize<AbpAuditLogs>(
                    c => c
                    .FromFactory(new MethodInvoker(new FactoryMethodQuery()))
                    .With(x => x.TenantId, 1));
            }
        }
    }
}
