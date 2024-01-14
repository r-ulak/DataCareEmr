using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.DTO;
using System.Collections.Generic;
using EMR.Manager.Service;

namespace EMR.OutcomeCode
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class OutcomeCodeAppService : EMRAppServiceBase, IOutcomeCodeAppService
    {
        private readonly IOutcomeCodeManager _outcomecodeManager;

        public OutcomeCodeAppService(IOutcomeCodeManager outcomecodeManager)
        {
            _outcomecodeManager = outcomecodeManager;
        }

        public async Task<List<OutcomeCodeResultDto>> GetOutcomeCode()
        {
            return await _outcomecodeManager.GetOutcomeCodeAsync();
        }        
    }
}
