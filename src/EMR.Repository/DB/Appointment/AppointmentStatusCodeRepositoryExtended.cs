using EMR.DataAccess.Infrastructure.Database;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for AppointmentStatusCode
    /// </summary>
    public class AppointmentStatusCodeRepositoryExtended : AppointmentStatusCodeRepository, IAppointmentStatusCodeRepositoryExtended
    {
        public AppointmentStatusCodeRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

    }
}
