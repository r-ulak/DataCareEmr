using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using Abp.AutoMapper;
using EMR.Entities;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for LoincCode
    /// </summary>
    public class LoincCodeManager : ILoincCodeManager, ISingletonDependency
    {
        private readonly ILoincCodeRepositoryExtended _loincRepositoryExtended;
        public LoincCodeManager(ILoincCodeRepositoryExtended loincRepositoryExtended)
        {
            _loincRepositoryExtended = loincRepositoryExtended;
        }
        public async Task<bool> CheckLoincExists(LoincCodeInputDto input)
        {
            return await _loincRepositoryExtended.CheckLoincExists(input);
        }
        public async Task CreateLoincCodeAsync(LoincCodeCreateDto input)
        {
            await _loincRepositoryExtended.InsertAsync(input.MapTo<LoincCode>());
        }
    }
}
