using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IOrderResultManager
    {
        Task<List<OrderResultGroupDto>> GetOrderResultDetailByPidAsync(PatientDataInputDto input);

        Task<long> CreateOrderResultAsync(OrderResultCreateDto input);
        Task UpdateOrderResultAsync(List<OrderResultCreateDto> input);
        Task<List<OrderResultGroupDto>> GetOrderResultDetailByOrderIdAsync(OrderSpecimenInputDto input);
        Task ArchiveOrderResultAsync(OrderResultUpdateDto input);
    }
}
