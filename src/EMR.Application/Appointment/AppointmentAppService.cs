using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using EMR.Configuration;
using EMR.Entities;

namespace EMR.Appointment
{
    [AbpAuthorize(PermissionNames.PagesAppointment)]
    public class AppointmentAppService : EMRAppServiceBase, IAppointmentAppService
    {
        private readonly IAppointmentManager _appointmentManager;

        private readonly IAppointmentCodeManager _appointmentCodeManager;
        private readonly IAppointmentStatusCodeManager _appointmentStatusCodeManager;

        public AppointmentAppService(IAppointmentManager appointmentManager, IAppointmentCodeManager appointmentCodeManager, IAppointmentStatusCodeManager appointmentStatusCodeManager)
        {
            _appointmentManager = appointmentManager;
            _appointmentCodeManager = appointmentCodeManager;
            _appointmentStatusCodeManager = appointmentStatusCodeManager;
        }

        [AbpAuthorize(PermissionNames.PagesAppointmentWrite)]
        public async Task<long> CreateAppointment(AppointmentCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            return await _appointmentManager.CreateAppointmentAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesAppointmentWrite)]
        public async Task UpdateAppointment(AppointmentCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _appointmentManager.UpdateAppointmentAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesAppointmentRead)]
        public async Task<List<AppointmentResultDto>> GetAppointmentDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _appointmentManager.GetAppointmentDetailByPidAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesAppointmentRead)]
        public async Task<List<AppointmentResultDto>> GetAppointmentByMonth(AppointmentInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _appointmentManager.GetAppointmentByMonthAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesAppointmentRead)]
        public async Task<List<AppointmentResultDto>> GetAppointmentByDate(AppointmentInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _appointmentManager.GetAppointmentByDateAsync(input);
        }

        public async Task<List<AppointmentCode>> GetAppointmentCode()
        {
            return await _appointmentCodeManager.GetAppointmentCodeAsync();
        }

        public async Task<List<AppointmentStatusCode>> GetAppointmentStatusCode()
        {
            return await _appointmentStatusCodeManager.GetAppointmentStatusCodeAsync();
        }
    }
}
