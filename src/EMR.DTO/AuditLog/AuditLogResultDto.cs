﻿using System;

namespace EMR.DTO.AuditLog
{
    public class AuditLogResultDto
    {
        public int Id { get; set; }
        public string ServiceName { get; set; }
        public string UserName { get; set; }
        public string MethodName { get; set; }
        public string Parameters { get; set; }
        public DateTime ExecutionTime { get; set; }
        public int ExecutionDuration { get; set; }
        public string ClientIpAddress { get; set; }
        public string ClientName { get; set; }
        public string BrowserInfo { get; set; }
        public string Exception { get; set; }
        public string CustomData { get; set; }
    }
}
