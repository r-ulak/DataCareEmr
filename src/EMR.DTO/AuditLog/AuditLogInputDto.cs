using EMR.DTO.Common;
using System;

namespace EMR.DTO.AuditLog
{
    public class AuditLogInputDto
    {
        public DateRangeDto DateRange { get; set; }
        public bool DateFilter { get; set; }
        public string UserName { get; set; }
        public long UserId { get; set; }
        public bool UserIdFilter { get; set; }
        public string ServiceName { get; set; }
        public bool ServiceNameFilter { get; set; }
        public int ExecutionDurationMin { get; set; }
        public int ExecutionDurationMax { get; set; }
        public bool ExecutionDurationFilter { get; set; }
        public string MethodName { get; set; }
        public bool MethodNameFilter { get; set; }
        public string BrowserInfo { get; set; }
        public bool BrowserInfoFilter { get; set; }
        public bool ErrorState { get; set; }
        public bool ErrorStateFilter { get; set; }
        public int TenantId { get; set; }
        public int Offset { get; set; }
        public int MaxLimit { get; set; }
        public AuditLogInputDto()
        {
            DateRange = new DateRangeDto();
        }
    }
}
