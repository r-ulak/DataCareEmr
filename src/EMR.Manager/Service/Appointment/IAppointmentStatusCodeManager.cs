using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface IAppointmentStatusCodeManager
    {
        Task<List<AppointmentStatusCode>> GetAppointmentStatusCodeAsync();
    }
}
