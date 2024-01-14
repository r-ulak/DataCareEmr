using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using Abp.Application.Services.Dto;
using EMR.DTO.PatientSearch.Dto;
using EMR.Configuration;
using Abp.AutoMapper;

namespace EMR.PatientData
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class PatientDataAppService : EMRAppServiceBase, IPatientDataAppService
    {
        private readonly IPatientDataManager _patientDataManager;

        public PatientDataAppService(IPatientDataManager pateientDataManager)
        {
            _patientDataManager = pateientDataManager;
        }
        public async Task<PatientDataDto> GetPatientData(PatientDataInputDto searchInput)
        {
            searchInput.TenantId = GetTenantId();
            return await _patientDataManager.GetPatientDataAsync(searchInput);
        }
        public async Task<ListResultDto<PatientSearchResultDto>> GetSearchResult(PatientSearchInputDto searchInput)
        {
            searchInput.PageSize = GetSettingValue<int>(EMRSettingNames.PatientSearchResultPageSize);
            searchInput.TenantId = GetTenantId();
            return await _patientDataManager.GetSearchResultAsync(searchInput);
        }

        public async Task<long> Create(PatientDataDto input)
        {
            input.TenantId = GetTenantId();
            return await _patientDataManager.CreatePatientAsync(input);
        }

        public async Task UpdatePatient(PatientDataDto input)
        {
            input.TenantId = GetTenantId();
            await _patientDataManager.UpdatePatientAsync(input);
        }
    }
}