using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.Entities;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for AppointmentStatusCode
    /// </summary>
    public class AppointmentStatusCodeManager : IAppointmentStatusCodeManager, ISingletonDependency
    {
        private readonly IAppointmentStatusCodeRepositoryExtended _appointmentstatuscodeRepositoryExtended;

        private readonly IRedisCacheStore _cacheStore;

        public AppointmentStatusCodeManager(
            IAppointmentStatusCodeRepositoryExtended appointmentstatuscodeRepositoryExtended,
            IRedisCacheStore cacheStore)
        {
            _appointmentstatuscodeRepositoryExtended = appointmentstatuscodeRepositoryExtended;
            _cacheStore = cacheStore;
        }


        public async Task<List<AppointmentStatusCode>> GetAppointmentStatusCodeAsync()
        {
            return await _cacheStore.GetAsync("AppointmentStatusCode", EMRConsts.TwentyFourHourTimeSpan,
                () => _appointmentstatuscodeRepositoryExtended.GetAllAsync());
        }
    }
}
