using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using EMR.DTO.Common;
using EMR.Manager.Service.Internal;
using Abp.UI;

namespace EMR.Diagnosis
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class DiagnosisAppService : EMRAppServiceBase, IDiagnosisAppService
    {
        private readonly IDiagnosisManager _diagnosisManager;
        private readonly IAzureRunSearch _azureRunSearch;
        private readonly IICDCodeCNManager _icdCNCodeManager;

        public DiagnosisAppService(IDiagnosisManager diagnosisManager, IAzureRunSearch azureRunSearch, IICDCodeCNManager icdCNCodeManager)
        {
            _diagnosisManager = diagnosisManager;
            _azureRunSearch = azureRunSearch;
            _icdCNCodeManager = icdCNCodeManager;
        }

        public async Task<long> CreateDiagnosis(DiagnosisCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            var codeExists = await _icdCNCodeManager.CheckCNExists(new ICDCodeCNInputDto()
            {
                ICDCodeCNId = input.ICDCodeCNId,
                TenantId = (int)input.TenantId
            });
            if (!codeExists)
            {
                throw new UserFriendlyException("ICDCN code or Custom Code Could not be found");
            }
            return await _diagnosisManager.CreateDiagnosisAsync(input);
        }

        public async Task UpdateDiagnosis(DiagnosisUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _diagnosisManager.UpdateDiagnosisAsync(input);
        }

        public async Task<List<DiagnosisResultDto>> GetDiagnosisDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _diagnosisManager.GetDiagnosisDetailByPidAsync(input);
        }

        public async Task<IEnumerable<ICDCodeCNResultDto>> GetCNCode(AzureSearchInputDto input)
        {
            input.TenantId = GetTenantId();
            input.Limit = EMRConsts.EMRAzureICD10CNLimit;
            input.IndexName = EMRConsts.EMRAzureIndexNameICD10CN;
            return await _azureRunSearch.SearchAsync<ICDCodeCNResultDto>(input);
        }

        public async Task<List<DiagnosisResultDto>> GetDiagnosisDetailByVisitIdAndPid(PatientVisitDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _diagnosisManager.GetDiagnosisDetailByVisitIdAndPidAsync(input);
        }
    }
}
