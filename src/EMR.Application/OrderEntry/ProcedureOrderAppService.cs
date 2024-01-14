using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using Abp.UI;
using EMR.Entities;
using EMR.Manager.Service.Internal;
using EMR.DTO.Common;


namespace EMR.ProcedureOrder
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class ProcedureOrderAppService : EMRAppServiceBase, IProcedureOrderAppService
    {
        private readonly IProcedureOrderManager _procedureorderManager;
        private readonly IAbnormalCodeManager _abnormalCodeManager;
        private readonly IPriorityCodeManager _priorityCodeManager;
        private readonly IResultStatusCodeManager _resultStatusCodeManager;
        private readonly IResultDataCodeManager _resultDataCodeManager;
        private readonly ILoincUnitCodeManager _unitCodeManager;
        private readonly ISpecimenCodeManager _specimenCodeManager;
        private readonly IAzureRunSearch _azureRunSearch;
        private readonly ILoincCodeManager _loincCodeManager;

        public ProcedureOrderAppService(IProcedureOrderManager procedureorderManager, IAbnormalCodeManager abnormalCodeManager,
            IPriorityCodeManager priorityCodeManager, IResultStatusCodeManager resultStatusCodeManager,
            IResultDataCodeManager resultDataCodeManager, ILoincUnitCodeManager unitCodeManager,
            ISpecimenCodeManager specimenCodeManager, IAzureRunSearch azureRunSearch, ILoincCodeManager loincCodeManager)
        {
            _procedureorderManager = procedureorderManager;
            _abnormalCodeManager = abnormalCodeManager;
            _priorityCodeManager = priorityCodeManager;
            _resultStatusCodeManager = resultStatusCodeManager;
            _resultDataCodeManager = resultDataCodeManager;
            _unitCodeManager = unitCodeManager;
            _specimenCodeManager = specimenCodeManager;
            _azureRunSearch = azureRunSearch;
            _loincCodeManager = loincCodeManager;
        }
        public async Task CreateLoincCode(LoincCodeCreateDto input)
        {
            input.TenantId = GetTenantId();
            var codeExists = await _loincCodeManager.CheckLoincExists(new LoincCodeInputDto()
            {
                LoincCodeId = input.LoincCodeId,
                TenantId = (int)input.TenantId
            });
            if (codeExists)
            {
                throw new UserFriendlyException("Test code or Custom Code already exists");
            }
            await _loincCodeManager.CreateLoincCodeAsync(input);
        }

        public async Task<long> CreateProcedureOrder(ProcedureOrderCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = input.OrderDate = Clock.Now;
            input.StatusCodeId = EMRConsts.ActiveStatus;
            return await _procedureorderManager.CreateProcedureOrderAsync(input);
        }

        public async Task UpdateProcedureOrder(ProcedureOrderUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _procedureorderManager.UpdateProcedureOrderAsync(input);
        }

        public async Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _procedureorderManager.GetProcedureOrderDetailByPidAsync(input);
        }

        public async Task<List<AbnormalCode>> GetAbnormalCode()
        {
            return await _abnormalCodeManager.GetAbnormalCodeAsync();
        }

        public async Task<List<PriorityCode>> GetPriorityCode()
        {
            return await _priorityCodeManager.GetPriorityCodeAsync();
        }

        public async Task<List<ResultStatusCode>> GetResultStatusCode()
        {
            return await _resultStatusCodeManager.GetResultStatusCodeAsync();
        }

        public async Task<List<ResultDataCode>> GetResultDataCode()
        {
            return await _resultDataCodeManager.GetResultDataCodeAsync();
        }

        public async Task<LoincUnitCode> GetUnitCode(LoincUnitCode input)
        {
            input.TenantId = GetTenantId();
            return await _unitCodeManager.GetUnitCodeAsync(input);
        }

        public async Task<List<SpecimenCode>> GetSpecimenCode()
        {
            return await _specimenCodeManager.GetSpecimenCodeAsync();
        }

        public async Task<IEnumerable<LoincCodeResultDto>> GetLabRadCode(AzureSearchInputDto input)
        {
            input.TenantId = GetTenantId();
            input.Limit = EMRConsts.EMRAzureLoincLimit;
            input.IndexName = EMRConsts.EMRAzureIndexNameLoinc;
            return await _azureRunSearch.SearchAsync<LoincCodeResultDto>(input);
        }

        public async Task<List<LoincCodeResultDto>> GetParentTestCodes(LoincCodeInputDto input)
        {
            return await _procedureorderManager.GetParentLoincCodesAsync(input);
        }

        public async Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByVisitIdAndPid(PatientVisitDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _procedureorderManager.GetProcedureOrderDetailByVisitIdAndPidAsync(input);
        }
    }
}
