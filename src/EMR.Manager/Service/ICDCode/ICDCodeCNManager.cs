using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using Abp.AutoMapper;
using EMR.Entities;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for ICDCodeCN
    /// </summary>
    public class ICDCodeCNManager : IICDCodeCNManager, ISingletonDependency
    {
        private readonly IICDCodeCNRepositoryExtended _icdcodecnRepositoryExtended;
        public ICDCodeCNManager(IICDCodeCNRepositoryExtended icdcodecnRepositoryExtended)
        {
            _icdcodecnRepositoryExtended = icdcodecnRepositoryExtended;
        }
        public async Task<bool> CheckCNExists(ICDCodeCNInputDto input)
        {
            return await _icdcodecnRepositoryExtended.CheckCNExists(input);
        }
        public async Task CreateICDCodeCNAsync(ICDCodeCNCreateUpdateDto input)
        {
            await _icdcodecnRepositoryExtended.InsertAsync(input.MapTo<ICDCodeCN>());
        }
    }
}
