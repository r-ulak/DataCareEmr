using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;

namespace EMR.OutcomeCode
{
    public interface IOutcomeCodeAppService : IApplicationService
    {
        Task<List<OutcomeCodeResultDto>> GetOutcomeCode();
    }
}
