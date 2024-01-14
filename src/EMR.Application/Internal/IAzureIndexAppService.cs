using Abp.Application.Services;
using EMR.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EMR.Internal
{
    public interface IAzureIndexAppService : IApplicationService
    {
        bool RunJob(WebJob job);
        Task<List<WebJob>> GetAllWebJobs();

    }
}
