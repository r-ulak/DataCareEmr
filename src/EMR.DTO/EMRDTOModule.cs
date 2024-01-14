using System.Reflection;
using Abp.AutoMapper;
using Abp.Modules;

namespace EMR
{
    [DependsOn(typeof(EMRCoreModule), typeof(AbpAutoMapperModule))]
    public class EMRDTOModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
        }
    }
}
