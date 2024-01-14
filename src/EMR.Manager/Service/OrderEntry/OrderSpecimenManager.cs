
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
	/// <summary>
	/// Manager methods for OrderSpecimen
	/// </summary>
public class OrderSpecimenManager : IOrderSpecimenManager, ISingletonDependency
{
private readonly IOrderSpecimenRepositoryExtended _orderreportRepositoryExtended;
  public OrderSpecimenManager(IOrderSpecimenRepositoryExtended orderreportRepositoryExtended)
  {
    _orderreportRepositoryExtended = orderreportRepositoryExtended;
  }
           public async Task<long> CreateOrderSpecimenAsync(OrderSpecimenCreateDto input)
        {
            return await  _orderreportRepositoryExtended.InsertAsync(input.MapTo<OrderSpecimen>());
        }
        
        public async Task UpdateOrderSpecimenAsync(OrderSpecimenUpdateDto input)
        {
            var currentRecord = await _orderreportRepositoryExtended.GetByIdAsync(input.Id, input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.Id;
            await _orderreportRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);            
        }
        
        public async Task<List<OrderSpecimenResultDto>> GetOrderSpecimenDetailByOrderIdAsync(OrderSpecimenInputDto input)
        {
            return await _orderreportRepositoryExtended.GetOrderSpecimenDetailByOrderIdAsync(input);
        }        
  }
}
