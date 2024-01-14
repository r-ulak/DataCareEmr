
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
    /// Manager methods for Surgery
    /// </summary>
    public class SurgeryManager : ISurgeryManager, ISingletonDependency
    {
        private readonly ISurgeryRepositoryExtended _surgeryRepositoryExtended;
        public SurgeryManager(ISurgeryRepositoryExtended surgeryRepositoryExtended)
        {
            _surgeryRepositoryExtended = surgeryRepositoryExtended;
        }
        public async Task<long> CreateSurgeryAsync(SurgeryCreateDto input)
        {
            return await _surgeryRepositoryExtended.InsertAsync(input.MapTo<Surgery>());
        }

        public async Task UpdateSurgeryAsync(SurgeryUpdateDto input)
        {
            var currentRecord = await _surgeryRepositoryExtended.GetByIdAsync(input.Id, input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.Id;
            await _surgeryRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);
        }

        public async Task<List<SurgeryResultDto>> GetSurgeryDetailByPidAsync(PatientDataInputDto input)
        {
            return await _surgeryRepositoryExtended.GetSurgeryDetailByPidAsync(input);
        }

        public async Task<List<SurgeryResultDto>> GetSurgeryDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            return await _surgeryRepositoryExtended.GetSurgeryDetailByVisitIdAndPidAsync(input);
        }

    }
}
