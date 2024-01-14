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
    /// Repository methods for AppointmentCode
    /// </summary>
    public class AppointmentCodeRepositoryExtended : AppointmentCodeRepository, IAppointmentCodeRepositoryExtended, ISingletonDependency
    {
        public AppointmentCodeRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
    }
}
