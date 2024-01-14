
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
	/// <summary>
	/// Manager methods for DoseUnitCode
	/// </summary>
public class DoseUnitCodeManager : IDoseUnitCodeManager, ISingletonDependency
{
private readonly IDoseUnitCodeRepository _doseunitcodeRepository;
  public DoseUnitCodeManager(IDoseUnitCodeRepository doseunitcodeRepository)
  {
    _doseunitcodeRepository = doseunitcodeRepository;
  }
     
        
        public async Task<List<DoseUnitCode>> GetDoseUnitCodeAsync()
        {
            return await _doseunitcodeRepository.GetAllAsync();
        }        
  }
}
