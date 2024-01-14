using Abp.AutoMapper;
using EMR.Entities;
using System.Collections.Generic;

namespace EMR.DTO
{
    [AutoMap(typeof(OrderResult))]
    public class OrderResultGroupDto
    {
        public string LongCommonName { get; set; }
        public long OrderId { get; set; }
        public bool IsRad { get; set; }
        public bool IsPanel { get; set; }
        public IEnumerable<OrderResultDto> OrderResult { get; set; }

    }
}
