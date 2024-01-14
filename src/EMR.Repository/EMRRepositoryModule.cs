using System.Reflection;
using Abp.AutoMapper;
using Abp.Modules;

namespace EMR
{
    [DependsOn(typeof(EMRCoreModule),
        typeof(EMRDTOModule),
        typeof(AbpAutoMapperModule))]
    public class EMRRepositoryModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
        }
    }
}
