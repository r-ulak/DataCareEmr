using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.AuditLog;

namespace EMR.Manager.Service
{
    public interface IAbpAuditLogsManager
    {
        Task<List<AuditLogResultDto>> GetAuditLogsByFilterAsync(AuditLogInputDto input);
    }
}
