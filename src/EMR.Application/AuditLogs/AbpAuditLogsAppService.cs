using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using EMR.DTO.AuditLog;
using System;
using EMR.Configuration;

namespace EMR.AbpAuditLogsService
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class AbpAuditLogsAppService : EMRAppServiceBase, IAbpAuditLogsAppService
    {
        private readonly IAbpAuditLogsManager _abpauditlogsManager;

        public AbpAuditLogsAppService(IAbpAuditLogsManager abpauditlogsManager)
        {
            _abpauditlogsManager = abpauditlogsManager;
        }

        public async Task<List<AuditLogResultDto>> GetAuditLogsByFilter(AuditLogInputDto input)
        {
            input.TenantId = GetTenantId();
            input.MaxLimit = GetSettingValue<int>(EMRSettingNames.AuditLogResultPageSize);

            return await _abpauditlogsManager.GetAuditLogsByFilterAsync(input);
        }
    }
}
