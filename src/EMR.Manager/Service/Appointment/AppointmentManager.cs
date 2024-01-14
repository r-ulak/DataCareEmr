using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;
using Abp.UI;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for Appointment
    /// </summary>
    public class AppointmentManager : IAppointmentManager, ISingletonDependency
    {
        private const int ActiveAppointmentStatusCodeId = 1;
        private readonly IAppointmentRepositoryExtended _appointmentRepositoryExtended;
        public AppointmentManager(IAppointmentRepositoryExtended appointmentRepositoryExtended)
        {
            _appointmentRepositoryExtended = appointmentRepositoryExtended;
        }
        public async Task<long> CreateAppointmentAsync(AppointmentCreateDto input)
        {
            if (input.AllowOverlap || input.AppointmentStatusCodeId == ActiveAppointmentStatusCodeId || !await _appointmentRepositoryExtended.CheckAppointmentOverlap(input))
            {
                return await _appointmentRepositoryExtended.InsertAsync(input.MapTo<Appointment>());
            }
            throw new UserFriendlyException("Overlaps with another another appointment");
        }

        public async Task UpdateAppointmentAsync(AppointmentCreateDto input)
        {
            if (input.AllowOverlap || !await _appointmentRepositoryExtended.CheckAppointmentOverlap(input))
            {
                await _appointmentRepositoryExtended.UpdateAsync(input.MapTo<Appointment>());
            }
            else
            {
                throw new UserFriendlyException("Overlaps with another another appointment");
            }
        }

        public async Task<List<AppointmentResultDto>> GetAppointmentDetailByPidAsync(PatientDataInputDto input)
        {
            return await _appointmentRepositoryExtended.GetAppointmentDetailByPidAsync(input);
        }

        public async Task<List<AppointmentResultDto>> GetAppointmentByMonthAsync(AppointmentInputDto input)
        {
            return await _appointmentRepositoryExtended.GetAppointmentByMonthAsync(input);
        }

        public async Task<List<AppointmentResultDto>> GetAppointmentByDateAsync(AppointmentInputDto input)
        {
            return await _appointmentRepositoryExtended.GetAppointmentByDateAsync(input);
        }
    }
}
