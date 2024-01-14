
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for SpecimenCode
    /// </summary>
    public class SpecimenCodeManager : ISpecimenCodeManager, ISingletonDependency
    {
        private readonly ISpecimenCodeRepository _specimencodeRepository;
        public SpecimenCodeManager(ISpecimenCodeRepository specimencodeRepository)
        {
            _specimencodeRepository = specimencodeRepository;
        }

        public async Task<List<SpecimenCode>> GetSpecimenCodeAsync()
        {
            return await _specimencodeRepository.GetAllAsync();
        }
    }
}
