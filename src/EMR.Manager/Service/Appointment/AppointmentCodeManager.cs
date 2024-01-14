using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;
using EMR.Redis;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for AppointmentCode
    /// </summary>
    public class AppointmentCodeManager : IAppointmentCodeManager, ISingletonDependency
    {
        private readonly IAppointmentCodeRepositoryExtended _appointmentcodeRepositoryExtended;
        private readonly IRedisCacheStore _cacheStore;

        public AppointmentCodeManager(IAppointmentCodeRepositoryExtended appointmentcodeRepositoryExtended,
            IRedisCacheStore cacheStore)
        {
            _appointmentcodeRepositoryExtended = appointmentcodeRepositoryExtended;
            _cacheStore = cacheStore;
        }

        public async Task<List<AppointmentCode>> GetAppointmentCodeAsync()
        {
            return await _cacheStore.GetAsync("AppointmentCode", EMRConsts.TwentyFourHourTimeSpan,
                () => _appointmentcodeRepositoryExtended.GetAllAsync());
        }
    }
}
