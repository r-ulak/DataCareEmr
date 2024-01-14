using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public interface IOrderSpecimenRepositoryExtended : IOrderSpecimenRepository
    {
        Task<List<OrderSpecimenResultDto>> GetOrderSpecimenDetailByOrderIdAsync(OrderSpecimenInputDto input);    
    }
}

