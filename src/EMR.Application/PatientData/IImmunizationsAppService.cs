using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.Immunizations
{
    public interface IImmunizationsAppService : IApplicationService
    {
        Task<List<ImmunizationsResultDto>> GetImmunizationDetailByPid(PatientDataInputDto input);
        Task<long> CreateImmunization(CreateUpdateImmunizationsDto input);
        Task UpdateImmunization(CreateUpdateImmunizationsDto input);
        Task<List<ImmunizationCode>> GetImmunizationCode();
        Task<List<CompletionStatusCode>> GetCompletionStatusCode();
        Task<List<InformationSource>> GetInformationSource();
    }
}
