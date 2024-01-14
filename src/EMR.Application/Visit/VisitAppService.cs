using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using EMR.Entities;
using EMR.Configuration;
namespace EMR.Visit
{
    [AbpAuthorize(PermissionNames.PagesPatientViewVisit)]
    public class VisitAppService : EMRAppServiceBase, IVisitAppService
    {
        private readonly IVisitManager _visitManager;

        public VisitAppService(IVisitManager visitManager)
        {
            _visitManager = visitManager;
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewActiveVisitWrite)]
        public async Task<long> CreateVisit(VisitCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            input.VisitStatusCodeId = EMRConsts.RegistrationVisitStatusCode;
            return await _visitManager.CreateVisitAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewActiveVisitWrite)]
        public async Task UpdateVisit(VisitUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _visitManager.UpdateVisitAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewActiveVisitRead)]
        public async Task<VisitResultDto> GetVisitDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _visitManager.GetVisitDetailByPidAsync(input);
        }

        public async Task<List<VisitStatusCode>> GetVisitStatusCode()
        {
            return await _visitManager.GetVisitStatusCodeAsync();
        }

        public async Task<List<VisitCode>> GetVisitCode()
        {
            return await _visitManager.GetVisitCodeAsync();
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewActiveVisitRead)]
        public async Task<List<VisitResultDto>> GetActiveVisitByLoggedInUser(VisitSearchInputDto input)
        {
            input.LoggedInUserId = GetLoggedUserId();
            input.TenantId = GetTenantId();
            input.PageSize = GetSettingValue<int>(EMRSettingNames.ActiveVisitResultPageSize);

            return await _visitManager.GetActiveVisitByLoggedInUserAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewVisitRead)]
        public async Task<List<VisitResultDto>> GetVisitHistoryByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _visitManager.GetVisitHistoryByPidAsync(input);

        }
    }
}
