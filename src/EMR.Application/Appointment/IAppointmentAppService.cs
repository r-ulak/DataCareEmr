using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.Appointment
{
    public interface IAppointmentAppService : IApplicationService
    {
        Task<long> CreateAppointment(AppointmentCreateDto input);
        Task UpdateAppointment(AppointmentCreateDto input);
        Task<List<AppointmentResultDto>> GetAppointmentDetailByPid(PatientDataInputDto input);
        Task<List<AppointmentResultDto>> GetAppointmentByMonth(AppointmentInputDto input);
        Task<List<AppointmentStatusCode>> GetAppointmentStatusCode();
        Task<List<AppointmentCode>> GetAppointmentCode();
        Task<List<AppointmentResultDto>> GetAppointmentByDate(AppointmentInputDto input);

    }
}
