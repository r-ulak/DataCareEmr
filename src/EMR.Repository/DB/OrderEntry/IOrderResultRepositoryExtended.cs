using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IOrderResultRepositoryExtended : IOrderResultRepository
    {
        Task<List<OrderResultDto>> GetOrderResultDetailByPidAsync(PatientDataInputDto input);
        Task<List<OrderResultDto>> GetOrderResultDetailByOrderIdAsync(OrderSpecimenInputDto input);
        Task UpdateOrderResultStatusAsync(OrderResultUpdateDto input);
    }
}

