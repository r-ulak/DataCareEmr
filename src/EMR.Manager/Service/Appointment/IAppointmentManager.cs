using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IAppointmentManager
    {
        Task<long> CreateAppointmentAsync(AppointmentCreateDto input);
        Task UpdateAppointmentAsync(AppointmentCreateDto input);
        Task<List<AppointmentResultDto>> GetAppointmentDetailByPidAsync(PatientDataInputDto input);        
        Task<List<AppointmentResultDto>> GetAppointmentByMonthAsync(AppointmentInputDto input);
        Task<List<AppointmentResultDto>> GetAppointmentByDateAsync(AppointmentInputDto input);

    }
}
