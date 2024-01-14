using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    public interface IOrderSpecimenManager
    {
            Task<long> CreateOrderSpecimenAsync(OrderSpecimenCreateDto input);
        Task UpdateOrderSpecimenAsync(OrderSpecimenUpdateDto input);
        Task<List<OrderSpecimenResultDto>> GetOrderSpecimenDetailByOrderIdAsync(OrderSpecimenInputDto input);        
    }
}
