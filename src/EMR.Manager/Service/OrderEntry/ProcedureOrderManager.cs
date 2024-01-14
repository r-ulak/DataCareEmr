
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;
using System;
using System.Linq;
using Abp.Timing;
using Abp.UI;
using EMR.Helper;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for ProcedureOrder
    /// </summary>
    public class ProcedureOrderManager : IProcedureOrderManager, ISingletonDependency
    {
        private readonly IProcedureOrderRepositoryExtended _procedureorderRepositoryExtended;
        private readonly IOrderResultRepositoryExtended _orderresultRepositoryExtended;
        private readonly ILoincCodeRepositoryExtended _loincCodeRepositoryExtended;

        public ProcedureOrderManager(IProcedureOrderRepositoryExtended procedureorderRepositoryExtended, IOrderResultRepositoryExtended orderresultRepositoryExtended, ILoincCodeRepositoryExtended loincCodeRepositoryExtended)
        {
            _procedureorderRepositoryExtended = procedureorderRepositoryExtended;
            _orderresultRepositoryExtended = orderresultRepositoryExtended;
            _loincCodeRepositoryExtended = loincCodeRepositoryExtended;
        }

        public async Task<OrderResultDto> GetLoincCode(ProcedureOrderCreateDto input, string checkLoincCode)
        {
            var loincCode = (await
                _loincCodeRepositoryExtended.GetLoincCodeByLoincCodeIdAsync(new LoincCodeInputDto()
                {
                    TenantId = input.TenantId,
                    LoincCodeId = checkLoincCode
                })).FirstOrDefault();
            return loincCode?.MapTo<OrderResultDto>() ?? new OrderResultDto();
        }

        private async Task AddChildLoincCodeOrderTest(ProcedureOrderCreateDto input, long result)
        {
            var mappedLoinc = await GetLoincCode(input, input.LoincCodeId);
            await AddOrderResult(input, new LoincPanelCodeResultDto() { LoincCodeId = input.LoincCodeId, ParentLoincCodeId = input.LoincCodeId }, result, mappedLoinc);

        }
        public async Task<long> CreateProcedureOrderAsync(ProcedureOrderCreateDto input)
        {
            var result = await _procedureorderRepositoryExtended.InsertAsync(input.MapTo<ProcedureOrder>());
            var childTest = (await GetChildrenLoincCodesAsync(new LoincCodeInputDto()
            {
                LoincCodeId = input.LoincCodeId
            })) ?? new List<LoincPanelCodeResultDto>();

            if (childTest.Count == 0)
            {
                await AddChildLoincCodeOrderTest(input, result);
            }
            await childTest.Where(x => !x.HasChildren).ToList()
                .ForEachAsync(async item =>
                {
                    var mappedLoinc = await GetLoincCode(input, item.LoincCodeId);
                    await AddOrderResult(input, item, result, mappedLoinc);
                }
                );
            return result;
        }

        private async Task AddOrderResult(ProcedureOrderCreateDto input, LoincPanelCodeResultDto item, long result, OrderResultDto mappedLoinc)
        {
            await _orderresultRepositoryExtended.InsertAsync(
                OrderResult.Create(result, input.Pid, input.TenantId, input.CreateDate, false, input.OrderdById,
                    item.LoincCodeId, 2, string.Empty, 2, input.CreateDate, input.CreateDate,
                    input.CreatedBy, input.UpdatedBy, parentLoincCodeId: item.ParentLoincCodeId, resultStatusCodeId: EMRConsts.PendingResultStatus,
                    unit: mappedLoinc.SuggestedUnits.FirstOrDefault(),
                    rangeValue: mappedLoinc.SuggestedRange.FirstOrDefault()
                    ));
        }

        public async Task UpdateProcedureOrderAsync(ProcedureOrderUpdateDto input)
        {
            var currentRecord = await _procedureorderRepositoryExtended.GetByIdAsync(input.Id, input.TenantId);
            input.MapTo(currentRecord);
            await _procedureorderRepositoryExtended.UpdateAsync(
                currentRecord);
        }

        public async Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByPidAsync(PatientDataInputDto input)
        {
            return await _procedureorderRepositoryExtended.GetProcedureOrderDetailByPidAsync(input);
        }

        public async Task<List<LoincCodeResultDto>> GetParentLoincCodesAsync(LoincCodeInputDto input)
        {
            return await _procedureorderRepositoryExtended.GetParentLoincCodesAsync(input);
        }

        public async Task<List<LoincPanelCodeResultDto>> GetChildrenLoincCodesAsync(LoincCodeInputDto input)
        {
            return await _procedureorderRepositoryExtended.GetChildrenLoincCodesAsync(input);
        }

        public async Task<List<ProcedureOrderResultDto>> GetProcedureOrderDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            return await _procedureorderRepositoryExtended.GetProcedureOrderDetailByVisitIdAndPidAsync(input);
        }
    }
}
