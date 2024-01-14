
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
	/// <summary>
	/// Manager methods for FrequencyCode
	/// </summary>
public class FrequencyCodeManager : IFrequencyCodeManager, ISingletonDependency
{
private readonly IFrequencyCodeRepository _frequencycodeRepository;
  public FrequencyCodeManager(IFrequencyCodeRepository frequencycodeRepository)
  {
    _frequencycodeRepository = frequencycodeRepository;
  }

        public async Task<List<FrequencyCode>> GetFrequencyCodeAsync()
        {
            return await _frequencycodeRepository.GetAllAsync();
        }        
  }
}
