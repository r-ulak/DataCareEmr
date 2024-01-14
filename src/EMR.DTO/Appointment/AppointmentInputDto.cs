using System;

namespace EMR.DTO
{
    public class AppointmentInputDto
    {
        public int TenantId { get; set; }
        public int AdministrationSiteId { get; set; }
        public DateTime ViewDate { get; set; }
    }
}
