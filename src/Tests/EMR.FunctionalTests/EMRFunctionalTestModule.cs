using System.Reflection;
using Abp.Modules;
using Abp.MultiTenancy;
using Abp.TestBase;
using Abp.Zero.Configuration;
using Castle.MicroKernel.Registration;
using Rhino.Mocks;

namespace EMR.IntegrationTests
{
    [DependsOn(
        typeof(EMRApplicationModule),
        typeof(EMRDataModule),
        typeof(EMRCoreModule),
        typeof(AbpTestBaseModule))]
    public class EMRFunctionalTestModule : AbpModule
    {
        public override void PreInitialize()
        {
            //Use database for language management
            Configuration.Modules.Zero().LanguageManagement.EnableDbLocalization();

            //Registering fake services
            IocManager.IocContainer.Register(
                Component.For<IAbpZeroDbMigrator>()
                    .UsingFactoryMethod(() => MockRepository.GenerateMock<IAbpZeroDbMigrator>())
                    .LifestyleSingleton()
                );

        }
    }
}
