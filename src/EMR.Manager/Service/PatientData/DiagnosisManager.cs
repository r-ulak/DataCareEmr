
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for Diagnosis
    /// </summary>
    public class DiagnosisManager : IDiagnosisManager, ISingletonDependency
    {
        private readonly IDiagnosisRepositoryExtended _diagnosisRepositoryExtended;
        public DiagnosisManager(IDiagnosisRepositoryExtended diagnosisRepositoryExtended)
        {
            _diagnosisRepositoryExtended = diagnosisRepositoryExtended;
        }
        public async Task<long> CreateDiagnosisAsync(DiagnosisCreateDto input)
        {
            return await _diagnosisRepositoryExtended.InsertAsync(input.MapTo<Diagnosis>());
        }

        public async Task UpdateDiagnosisAsync(DiagnosisUpdateDto input)
        {
            var currentRecord = await _diagnosisRepositoryExtended.GetByIdAsync(input.Id, input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.Id;
            await _diagnosisRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);
        }

        public async Task<List<DiagnosisResultDto>> GetDiagnosisDetailByPidAsync(PatientDataInputDto input)
        {
            return await _diagnosisRepositoryExtended.GetDiagnosisDetailByPidAsync(input);
        }

        public async Task<List<DiagnosisResultDto>> GetDiagnosisDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            return await _diagnosisRepositoryExtended.GetDiagnosisDetailByVisitIdAndPidAsync(input);
        }
    }
}
