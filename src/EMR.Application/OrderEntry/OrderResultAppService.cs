using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using Abp.UI;

namespace EMR.OrderResult
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class OrderResultAppService : EMRAppServiceBase, IOrderResultAppService
    {
        private readonly IOrderResultManager _orderresultManager;

        public OrderResultAppService(IOrderResultManager orderresultManager)
        {
            _orderresultManager = orderresultManager;
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewLabOrderResultWrite)]
        public async Task<long> CreateOrderResult(OrderResultCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            return await _orderresultManager.CreateOrderResultAsync(input);
        }

        public async Task UpdateOrderResult(OrderResultCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _orderresultManager.UpdateOrderResultAsync(new List<OrderResultCreateDto>() { input });
        }
        [AbpAuthorize(PermissionNames.PagesPatientViewLabOrderResultWrite)]
        public async Task UpdateAllOrderResult(List<OrderResultCreateDto> input)
        {
            var tenantId = GetTenantId();
            var loggedUser = GetLoggedUserId();
            var updateDate = Clock.Now;
            foreach (var orderResultCreateDto in input)
            {
                orderResultCreateDto.TenantId = tenantId;
                orderResultCreateDto.UpdatedBy = loggedUser;
                orderResultCreateDto.UpdateDate = updateDate;
            }
            await _orderresultManager.UpdateOrderResultAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewLabOrderResultRead)]
        public async Task<List<OrderResultGroupDto>> GetOrderResultDetailByOrderId(OrderSpecimenInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _orderresultManager.GetOrderResultDetailByOrderIdAsync(input);
        }

        [AbpAuthorize(PermissionNames.PagesPatientViewLabOrderResultRead)]
        public async Task<List<OrderResultGroupDto>> GetOrderResultDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _orderresultManager.GetOrderResultDetailByPidAsync(input);
        }
    }
}
