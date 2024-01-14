using Abp.Dependency;
using System.Collections.Generic;
using System.Linq;
using EMR.DAL;
using System.Threading.Tasks;
using Abp.Authorization;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;
using Abp.UI;
using EMR.Authorization;
using EMR.Helper;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for OrderResult
    /// </summary>
    public class OrderResultManager : IOrderResultManager, ISingletonDependency
    {
        private readonly IOrderResultRepositoryExtended _orderresultRepositoryExtended;
        private readonly IPermissionChecker _permissionChecker;

        public OrderResultManager(IOrderResultRepositoryExtended orderresultRepositoryExtended,
            IPermissionChecker permissionChecker)
        {
            _orderresultRepositoryExtended = orderresultRepositoryExtended;
            _permissionChecker = permissionChecker;
        }

        public async Task<long> CreateOrderResultAsync(OrderResultCreateDto input)
        {
            return await _orderresultRepositoryExtended.InsertAsync(input.MapTo<OrderResult>());
        }

        public async Task ArchiveOrderResultAsync(OrderResultUpdateDto input)
        {
            var currentRecord = await _orderresultRepositoryExtended.GetByIdAsync(input.Id, input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.Id;
            await _orderresultRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);
        }

        public async Task UpdateOrderResultAsync(List<OrderResultCreateDto> input)
        {
            if (input.Count(x => x.ResultStatusCodeId == EMRConsts.SignedAndReviewedByLabOrRad) > 0)
            {
                CheckPermissionPagesPatientViewLabOrderResultSignOff();
            }
            await input.ForEachAsync(async item =>
            {
                var currentRecord = await _orderresultRepositoryExtended.GetByIdAsync(item.Id, item.TenantId);
                item.CreateDate = currentRecord.CreateDate;
                item.CreatedBy = currentRecord.CreatedBy;
                await _orderresultRepositoryExtended.UpdateAsync(item.MapTo<OrderResult>());
            });
        }

        private void CheckPermissionPagesPatientViewLabOrderResultSignOff()
        {
            var signOffAllowed =
                 _permissionChecker.IsGranted(PermissionNames.PagesPatientViewLabOrderResultSignOff);
            if (!signOffAllowed)
            {
                throw new UserFriendlyException("UnAuthorzied activity detected");
            }
        }

        public async Task<List<OrderResultGroupDto>> GetOrderResultDetailByOrderIdAsync(OrderSpecimenInputDto input)
        {
            var result = await _orderresultRepositoryExtended.GetOrderResultDetailByOrderIdAsync(input);
            return GroupResult(result);
        }

        public async Task<List<OrderResultGroupDto>> GetOrderResultDetailByPidAsync(PatientDataInputDto input)
        {
            var result = await _orderresultRepositoryExtended.GetOrderResultDetailByPidAsync(input);
            return GroupResult(result);
        }

        private List<OrderResultGroupDto> GroupResult(List<OrderResultDto> result)
        {
            return result.
                GroupBy(x => new { x.ParentLonicLongName, x.ParentLoincCodeId, x.OrderId },
                    (key, group) =>
                    {
                        var orderResultDtos = @group as OrderResultDto[] ?? @group.ToArray();
                        return new OrderResultGroupDto()
                        {
                            LongCommonName = key.ParentLonicLongName ?? "No Parent Panel",
                            IsRad = orderResultDtos.First().IsRad,
                            OrderId = key.OrderId,
                            IsPanel = orderResultDtos.Count() > 1 && orderResultDtos.Count(x => x.LoincCodeId != key.ParentLoincCodeId) > 1,
                            OrderResult = orderResultDtos
                        };
                    }).ToList();
        }
    }
}
