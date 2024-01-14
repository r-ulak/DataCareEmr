
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
	/// <summary>
	/// Manager methods for DrugFormCode
	/// </summary>
public class DrugFormCodeManager : IDrugFormCodeManager, ISingletonDependency
{
private readonly IDrugFormCodeRepository _drugformcodeRepository;
  public DrugFormCodeManager(IDrugFormCodeRepository drugformcodeRepository)
  {
    _drugformcodeRepository = drugformcodeRepository;
  }

        public async Task<List<DrugFormCode>> GetDrugFormCodeAsync()
        {
            return await _drugformcodeRepository.GetAllAsync();
        }        
  }
}
