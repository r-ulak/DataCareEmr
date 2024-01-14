using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.AuditLog;

namespace EMR.AbpAuditLogsService
{
    public interface IAbpAuditLogsAppService : IApplicationService
    {
        Task<List<AuditLogResultDto>> GetAuditLogsByFilter(AuditLogInputDto input);
    }
}
