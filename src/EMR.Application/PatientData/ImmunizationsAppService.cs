using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using EMR.Entities;

namespace EMR.Immunizations
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class ImmunizationsAppService : EMRAppServiceBase, IImmunizationsAppService
    {
        private readonly IImmunizationsManager _immunizationsManager;

        public ImmunizationsAppService(IImmunizationsManager immunizationsManager)
        {
            _immunizationsManager = immunizationsManager;
        }
        public async Task<List<ImmunizationsResultDto>> GetImmunizationDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _immunizationsManager.GetImmunizationDetailByPidAsync(input);
        }

        public async Task<long> CreateImmunization(CreateUpdateImmunizationsDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            return await _immunizationsManager.CreateImmunizationAsync(input);
        }


        public async Task UpdateImmunization(CreateUpdateImmunizationsDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _immunizationsManager.UpdateImmunizationAsync(input);
        }

        public async Task<List<ImmunizationCode>> GetImmunizationCode()
        {
            return await _immunizationsManager.GetImmunizationCodeAsync();
        }

        public async Task<List<CompletionStatusCode>> GetCompletionStatusCode()
        {
            return await _immunizationsManager.GetCompletionStatusCodeAsync();
        }

        public async Task<List<InformationSource>> GetInformationSource()
        {
            return await _immunizationsManager.GetInformationSourceAsync();
        }
    }
}
