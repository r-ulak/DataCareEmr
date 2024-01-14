using System.Reflection;
using Abp.AutoMapper;
using Abp.Modules;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.Resolvers.SpecializedResolvers;
using EMR.Manager.Service;
using EMR.Manager.Service.Internal;

namespace EMR
{
    [DependsOn(typeof(EMRCoreModule),
        typeof(EMRDTOModule),
        typeof(EMRRepositoryModule),
        typeof(AbpAutoMapperModule))]
    public class EMRManagerModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
            IocManager.IocContainer.Register(Classes.FromThisAssembly().BasedOn<IAzureSearchIndexType>().WithService.FromInterface());

            IocManager.IocContainer.Register(Classes.FromThisAssembly().BasedOn<IDocumentController>().WithService.FromInterface());

            var collectionResolver = new CollectionResolver(IocManager.IocContainer.Kernel);
            IocManager.IocContainer.Kernel.Resolver.AddSubResolver(collectionResolver);

        }
    }
}
