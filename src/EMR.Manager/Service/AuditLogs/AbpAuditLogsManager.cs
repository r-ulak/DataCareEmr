using System;
using System.Collections.Generic;
using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using EMR.Base;
using EMR.DTO.AuditLog;
using System.Linq;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for AbpAuditLogs
    /// </summary>
    public class AbpAuditLogsManager : IAbpAuditLogsManager, ISingletonDependency
    {
        private readonly IAbpAuditLogsRepositoryExtended _abpauditlogsRepositoryExtended;
        private readonly IAbpUsersRepositoryExtended _abpUserRepositoryExtended;
        public AbpAuditLogsManager(IAbpAuditLogsRepositoryExtended abpauditlogsRepositoryExtended, IAbpUsersRepositoryExtended abpUserRepositoryExtended)
        {
            _abpauditlogsRepositoryExtended = abpauditlogsRepositoryExtended;
            _abpUserRepositoryExtended = abpUserRepositoryExtended;
        }


        public async Task<List<AuditLogResultDto>> GetAuditLogsByFilterAsync(AuditLogInputDto input)
        {
            input.UserId = 0;
            if (input.UserIdFilter == true && !string.IsNullOrEmpty(input.UserName))
            {
                var user = (await _abpUserRepositoryExtended.GetByUserNameAsync(input.UserName, input.TenantId)).FirstOrDefault();
                if (user != null)
                {
                    input.UserId = user.Id;
                }
            }
            return await _abpauditlogsRepositoryExtended.GetAuditLogsByFilterAsync(input);
        }
    }
}
