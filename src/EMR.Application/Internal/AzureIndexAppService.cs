using Abp.Authorization;
using EMR.Authorization;
using EMR.Entities;
using EMR.Manager.Service;
using EMR.Manager.Service.Internal;
using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Runtime.Session;
using Hangfire;

namespace EMR.Internal
{
    [AbpAuthorize(PermissionNames.PagesHostOnly)]
    public class AzureIndexAppService : EMRAppServiceBase, IAzureIndexAppService
    {
        private readonly IWebJobManager _webJobManager;
        private readonly IAzureSearchIndexService _azureSearchIndexService;
        public AzureIndexAppService(IWebJobManager webJobManager, IAzureSearchIndexService azureSearchIndexService)
        {
            _webJobManager = webJobManager;
            _azureSearchIndexService = azureSearchIndexService;
        }

        [AbpAuthorize(PermissionNames.PagesHostOnlyJobs)]
        public bool RunJob(WebJob job)
        {
            var userIdentifier = AbpSession.ToUserIdentifier();
            var jobId = BackgroundJob.Enqueue(() =>
               _azureSearchIndexService.RunAzureSearcIndex(job.JobName, userIdentifier, null)
               );
            return jobId.Length > 0;
        }

        public async Task<List<WebJob>> GetAllWebJobs()
        {
            return await _webJobManager.GetAllWebJobsAsync();
        }
    }
}
