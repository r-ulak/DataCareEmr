using System.Reflection;
using Abp.AutoMapper;
using Abp.Modules;
using EMR;

namespace EMR
{
    [DependsOn(typeof(EMRCoreModule)
        ,typeof(EMRManagerModule),
        typeof(EMRRepositoryModule),
        typeof(AbpAutoMapperModule))]
    public class EMRApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Modules.AbpAutoMapper().Configurators.Add(mapper =>
            {
                //Add your custom AutoMapper mappings here...
                //mapper.CreateMap<,>()
            });
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
        }
    }
}
