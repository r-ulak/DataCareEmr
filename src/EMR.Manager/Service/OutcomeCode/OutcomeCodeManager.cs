
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using Abp.AutoMapper;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for OutcomeCode
    /// </summary>
    public class OutcomeCodeManager : IOutcomeCodeManager, ISingletonDependency
    {
        private readonly IOutcomeCodeRepositoryExtended _outcomecodeRepositoryExtended;
        public OutcomeCodeManager(IOutcomeCodeRepositoryExtended outcomecodeRepositoryExtended)
        {
            _outcomecodeRepositoryExtended = outcomecodeRepositoryExtended;
        }

        public async Task<List<OutcomeCodeResultDto>> GetOutcomeCodeAsync()
        {
            return (await _outcomecodeRepositoryExtended.GetAllAsync()).MapTo<List<OutcomeCodeResultDto>>();
        }
    }
}
