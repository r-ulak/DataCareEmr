using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.OrderResult
{
    public interface IOrderResultAppService : IApplicationService
    {
        Task<long> CreateOrderResult(OrderResultCreateDto input);
        Task UpdateOrderResult(OrderResultCreateDto input);
        Task<List<OrderResultGroupDto>> GetOrderResultDetailByOrderId(OrderSpecimenInputDto input);
        Task<List<OrderResultGroupDto>> GetOrderResultDetailByPid(PatientDataInputDto input);
        Task UpdateAllOrderResult(List<OrderResultCreateDto> input);
    }
}
