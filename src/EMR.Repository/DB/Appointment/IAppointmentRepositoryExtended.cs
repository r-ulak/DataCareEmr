using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IAppointmentRepositoryExtended : IAppointmentRepository
    {
        Task<List<AppointmentResultDto>> GetAppointmentDetailByPidAsync(PatientDataInputDto input);
        Task<List<AppointmentResultDto>> GetAppointmentByMonthAsync(AppointmentInputDto input);
        Task<bool> CheckAppointmentOverlap(AppointmentCreateDto input);
        Task<List<AppointmentResultDto>> GetAppointmentByDateAsync(AppointmentInputDto input);


    }
}

