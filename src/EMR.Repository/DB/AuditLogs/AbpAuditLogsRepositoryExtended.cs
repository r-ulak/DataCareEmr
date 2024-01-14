using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.AuditLog;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for AbpAuditLogs
    /// </summary>
    public class AbpAuditLogsRepositoryExtended : AbpAuditLogsRepository, IAbpAuditLogsRepositoryExtended, ISingletonDependency
    {
        public AbpAuditLogsRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        { }
        public async Task<List<AuditLogResultDto>> GetAuditLogsByFilterAsync(AuditLogInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<AuditLogResultDto>("GetAuditLogsByFilter", new
            {
                input.DateRange.StartDate,
                input.DateRange.EndDate,
                input.DateFilter,
                input.UserId,
                input.UserIdFilter,
                input.ServiceName,
                input.ServiceNameFilter,
                input.ExecutionDurationMin,
                input.ExecutionDurationMax,
                input.ExecutionDurationFilter,
                input.MethodName,
                input.MethodNameFilter,
                input.ErrorState,
                input.ErrorStateFilter,
                input.BrowserInfo,
                input.BrowserInfoFilter,
                input.TenantId,
                input.Offset,
                input.MaxLimit

            })) ?? new List<AuditLogResultDto>();
            return result.ToList();
        }

    }
}

