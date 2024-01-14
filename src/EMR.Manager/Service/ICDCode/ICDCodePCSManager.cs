using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using Abp.AutoMapper;
using EMR.Entities;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for ICDCodePCS
    /// </summary>
    public class ICDCodePCSManager : IICDCodePCSManager, ISingletonDependency
    {
        private readonly IICDCodePCSRepositoryExtended _icdcodepcsRepositoryExtended;
        public ICDCodePCSManager(IICDCodePCSRepositoryExtended icdcodepcsRepositoryExtended)
        {
            _icdcodepcsRepositoryExtended = icdcodepcsRepositoryExtended;
        }
        public async Task<bool> CheckPCSExists(ICDCodePCSInputDto input)
        {
            return await _icdcodepcsRepositoryExtended.CheckPCSExists(input);
        }
        public async Task CreateICDCodePCSAsync(ICDCodePCSCreateUpdateDto input)
        {
            await _icdcodepcsRepositoryExtended.InsertAsync(input.MapTo<ICDCodePCS>());
        }
    }
}
