using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for OrderSpecimen
    /// </summary>
    public class OrderSpecimenRepositoryExtended : OrderSpecimenRepository, IOrderSpecimenRepositoryExtended, ISingletonDependency
    {
        public OrderSpecimenRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<OrderSpecimenResultDto>> GetOrderSpecimenDetailByOrderIdAsync(OrderSpecimenInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<OrderSpecimenResultDto>("GetOrderSpecimenDetailByOrderId", new
            {
                input.Id,
                input.TenantId,
                Pid = input.PatientId,
            })) ?? new List<OrderSpecimenResultDto>();

            return result.ToList();
        }
    }
}
