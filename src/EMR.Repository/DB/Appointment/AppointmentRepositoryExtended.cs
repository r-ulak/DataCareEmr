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
    /// Repository methods for Appointment
    /// </summary>
    public class AppointmentRepositoryExtended : AppointmentRepository, IAppointmentRepositoryExtended
    {
        public AppointmentRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<AppointmentResultDto>> GetAppointmentDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<AppointmentResultDto>("GetAppointmentDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<AppointmentResultDto>();

            return result.ToList();
        }

        public async Task<List<AppointmentResultDto>> GetAppointmentByMonthAsync(AppointmentInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<AppointmentResultDto>("GetAppointmentByMonth", new
            {
                input.TenantId,
                input.ViewDate
            })) ?? new List<AppointmentResultDto>();

            return result.ToList();
        }

        public async Task<List<AppointmentResultDto>> GetAppointmentByDateAsync(AppointmentInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<AppointmentResultDto>("GetAppointmentByDate", new
            {
                input.TenantId,
                input.ViewDate,
                input.AdministrationSiteId
            })) ?? new List<AppointmentResultDto>();

            return result.ToList();
        }

        public async Task<bool> CheckAppointmentOverlap(AppointmentCreateDto input)
        {
            return (await _procExecutor.ExecuteScalarAsync<bool>("CheckAppointmentOverlap", new
            {
                input.TenantId,
                input.ProviderId,
                input.StartDate,
                input.EndDate,
                input.Id
            }));
        }
    }
}
