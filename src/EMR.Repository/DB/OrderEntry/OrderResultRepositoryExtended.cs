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
    /// Repository methods for OrderResult
    /// </summary>
    public class OrderResultRepositoryExtended : OrderResultRepository, IOrderResultRepositoryExtended, ISingletonDependency
    {
        public OrderResultRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }
        public async Task<List<OrderResultDto>> GetOrderResultDetailByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<OrderResultDto>("GetOrderResultDetailByPid", new
            {
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<OrderResultDto>();

            return result.ToList();
        }
        public async Task<List<OrderResultDto>> GetOrderResultDetailByOrderIdAsync(OrderSpecimenInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<OrderResultDto>("GetOrderResultDetailByOrderId", new
            {
                input.Id,
                input.TenantId,
                Pid = input.PatientId
            })) ?? new List<OrderResultDto>();

            return result.ToList();
        }

        public async Task UpdateOrderResultStatusAsync(OrderResultUpdateDto input)
        {
            await _procExecutor.ExecuteAsync("UpdateOrderResultStatus", new
            {
                input.TenantId,
                input.Id,
                input.ResultStatusCodeId,
                input.UpdateDate,
                input.UpdatedBy,
                input.Pid
            });

        }
    }
}
