using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface IImmunizationsManager
    {
        Task<List<ImmunizationsResultDto>> GetImmunizationDetailByPidAsync(PatientDataInputDto input);
        Task<long> CreateImmunizationAsync(CreateUpdateImmunizationsDto input);
        Task UpdateImmunizationAsync(CreateUpdateImmunizationsDto input);

        Task<List<ImmunizationCode>> GetImmunizationCodeAsync();
        Task<List<CompletionStatusCode>> GetCompletionStatusCodeAsync();
        Task<List<InformationSource>> GetInformationSourceAsync();
    }
}
