
using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using System.Collections.Generic;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for WebJob
    /// </summary>
    public class WebJobManager : IWebJobManager, ISingletonDependency
    {
        private readonly IWebJobRepository _webjobRepository;
        public WebJobManager(IWebJobRepository webjobRepository)
        {
            _webjobRepository = webjobRepository;
        }

        public async Task<List<WebJob>> GetAllWebJobsAsync()
        {
            return await _webjobRepository.GetAllAsync();
        }
    }
}
