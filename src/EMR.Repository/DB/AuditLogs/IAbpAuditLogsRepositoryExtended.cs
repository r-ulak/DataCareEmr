using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.AuditLog;

namespace EMR.DAL
{
    public interface IAbpAuditLogsRepositoryExtended : IAbpAuditLogsRepository
    {
        Task<List<AuditLogResultDto>> GetAuditLogsByFilterAsync(AuditLogInputDto input);
    }
}

