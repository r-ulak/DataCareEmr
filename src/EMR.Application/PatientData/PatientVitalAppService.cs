using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using System;
using Abp.AutoMapper;

namespace EMR.PatientVital
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class PatientVitalAppService : EMRAppServiceBase, IPatientVitalAppService
    {
        private readonly IPatientVitalManager _patientVitalManager;

        public PatientVitalAppService(IPatientVitalManager patientVitalManager)
        {
            _patientVitalManager = patientVitalManager;
        }
        private DateTime RandomDayFunc(int i)
        {
            List<DateTime> dates = new List<DateTime>();
            return DateTime.Now.AddMonths((-i * 4) + 10);
        }
        public async Task<List<PatientVitalResultDto>> GetVitalTrend(PatientDataInputDto vitalInput)
        {
            Random gen = new Random();
            List<PatientVitalResultDto> output = new List<PatientVitalResultDto>();
            for (int i = 0; i < 30; i++)
            {
                output.Add(new PatientVitalResultDto()
                {
                    BMI = gen.Next(1, 100),
                    Bpd = gen.Next(1, 100),
                    Bps = gen.Next(1, 100),
                    Height = gen.Next(1, 100),
                    OxygenSaturation = gen.Next(1, 100),
                    Temperature = gen.Next(1, 100),
                    Pulse = gen.Next(1, 100),
                    Weight = gen.Next(1, 100),
                    CreateDate = RandomDayFunc(i)
                });
            }
            output.Sort((x, y) => DateTime.Compare(x.CreateDate, y.CreateDate));
            return await Task.FromResult(output);
        }
        public async Task CaptureVitals(CapturePatientVitalInputDto captureVitalInput)
        {
            captureVitalInput.TenantId = GetTenantId();
            var model = captureVitalInput.MapTo<Entities.PatientVital>();
            model.CreatedBy = GetLoggedUserId();
            model.CreateDate = DateTime.UtcNow;
            await _patientVitalManager.CreatePatientVitalAsync(model);
        }
    }
}