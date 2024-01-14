using System.Data.Entity;
using System.Reflection;
using Abp.Modules;
using EMR.EntityFramework;

namespace EMR.Migrator
{
    [DependsOn(typeof(EMRDataModule))]
    public class EMRMigratorModule : AbpModule
    {
        public override void PreInitialize()
        {
            Database.SetInitializer<EMRDbContext>(null);

            Configuration.BackgroundJobs.IsJobExecutionEnabled = false;
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
        }
    }
}