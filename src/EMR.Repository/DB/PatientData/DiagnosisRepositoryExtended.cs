using System;
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
    /// Repository methods for Diagnosis
    /// </summary>
    public class DiagnosisRepositoryExtended : DiagnosisRepository, IDiagnosisRepositoryExtended
    {
        public DiagnosisRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<DiagnosisResultDto>> GetDiagnosisDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<DiagnosisResultDto>("GetDiagnosisDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<DiagnosisResultDto>();

            return result.ToList();
        }

        public async Task<List<DiagnosisResultDto>> GetDiagnosisDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<DiagnosisResultDto>("GetDiagnosisDetailByVisitIdAndPid", new
            {
                input.TenantId,
                Pid = input.PatientId,
                input.VisitId
            })) ?? new List<DiagnosisResultDto>();

            return result.ToList();
        }
    }
}
