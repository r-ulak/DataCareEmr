
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
	/// <summary>
	/// Manager methods for DrugRouteCode
	/// </summary>
public class DrugRouteCodeManager : IDrugRouteCodeManager, ISingletonDependency
{
private readonly IDrugRouteCodeRepository _drugroutecodeRepository;
  public DrugRouteCodeManager(IDrugRouteCodeRepository drugroutecodeRepository)
  {
    _drugroutecodeRepository = drugroutecodeRepository;
  }
        
        public async Task<List<DrugRouteCode>> GetDrugRouteCodeAsync()
        {
            return await _drugroutecodeRepository.GetAllAsync();
        }        
  }
}
