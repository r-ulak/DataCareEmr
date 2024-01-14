using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.OrderSpecimen
{
    public interface IOrderSpecimenAppService : IApplicationService
    {
            Task<long> CreateOrderSpecimen(OrderSpecimenCreateDto input);
        Task UpdateOrderSpecimen(OrderSpecimenUpdateDto input);
             Task<List<OrderSpecimenResultDto>> GetOrderSpecimenDetailByOrderId(OrderSpecimenInputDto input);
    }
}
