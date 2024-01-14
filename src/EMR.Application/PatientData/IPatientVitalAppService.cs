using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Application.Services;

namespace EMR.PatientVital
{
    public interface IPatientVitalAppService : IApplicationService
    {
        Task<List<PatientVitalResultDto>> GetVitalTrend(PatientDataInputDto vitalInput);
        Task CaptureVitals(CapturePatientVitalInputDto captureVitalInput);
    }
}