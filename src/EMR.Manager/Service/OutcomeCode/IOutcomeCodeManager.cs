using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.Manager.Service
{
    public interface IOutcomeCodeManager
    {
        Task<List<OutcomeCodeResultDto>> GetOutcomeCodeAsync();


    }
}
