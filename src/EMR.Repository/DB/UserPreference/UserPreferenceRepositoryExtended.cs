using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for UserPreference
    /// </summary>
    public class UserPreferenceRepositoryExtended : UserPreferenceRepository, IUserPreferenceRepositoryExtended, ISingletonDependency
    {
        public UserPreferenceRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

    }
}
