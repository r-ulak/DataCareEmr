using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for StatusCode
    /// </summary>
    public class StatusCodeManager : IStatusCodeManager, ISingletonDependency
    {
        private readonly IStatusCodeRepository _statuscodeRepository;
        public StatusCodeManager(IStatusCodeRepository statuscodeRepository)
        {
            _statuscodeRepository = statuscodeRepository;
        }

        public async Task<List<StatusCode>> GetStatusCodeAsync()
        {
            return await _statuscodeRepository.GetAllAsync();
        }
    }
}
