
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
	/// <summary>
	/// Manager methods for TherapyCode
	/// </summary>
public class TherapyCodeManager : ITherapyCodeManager, ISingletonDependency
{
private readonly ITherapyCodeRepository _therapycodeRepository;
  public TherapyCodeManager(ITherapyCodeRepository therapycodeRepository)
  {
    _therapycodeRepository = therapycodeRepository;
  }

        public async Task<List<TherapyCode>> GetTherapyCodeAsync()
        {
            return await _therapycodeRepository.GetAllAsync();
        }        
  }
}
