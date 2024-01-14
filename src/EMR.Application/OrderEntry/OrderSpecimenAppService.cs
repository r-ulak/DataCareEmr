using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;

namespace EMR.OrderSpecimen
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class OrderSpecimenAppService : EMRAppServiceBase, IOrderSpecimenAppService
    {
        private readonly IOrderSpecimenManager _orderreportManager;

        public OrderSpecimenAppService(IOrderSpecimenManager orderreportManager)
        {
            _orderreportManager = orderreportManager;
        }
        
        public async Task<long> CreateOrderSpecimen(OrderSpecimenCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            input.StatusCodeId = EMRConsts.ActiveStatus;
            return await _orderreportManager.CreateOrderSpecimenAsync(input);
        }
        
        public async Task UpdateOrderSpecimen(OrderSpecimenUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await  _orderreportManager.UpdateOrderSpecimenAsync(input);
        }

        public async Task<List<OrderSpecimenResultDto>> GetOrderSpecimenDetailByOrderId(OrderSpecimenInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _orderreportManager.GetOrderSpecimenDetailByOrderIdAsync(input);
        }        
    }
}
