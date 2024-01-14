using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using System;
using EMR.Entities;
using Abp.Timing;
using System.Linq;
using EMR.Helper;
using Abp.UI;

namespace EMR.Prescription
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class PrescriptionAppService : EMRAppServiceBase, IPrescriptionAppService
    {
        private readonly IPrescriptionManager _prescriptionManager;
        private readonly IDrugFormCodeManager _drugFormCodeManager;
        private readonly ITherapyCodeManager _therapyCodeManager;
        private readonly IFrequencyCodeManager _frequencyCodeManager;
        private readonly IDrugRouteCodeManager _drugRouteCodeManager;
        private readonly IDoseUnitCodeManager _doseUnitCodeManager;
        private readonly IICDCodeCNManager _icdCNCodeManager;

        public PrescriptionAppService(IPrescriptionManager pateientDataManager, IDrugFormCodeManager drugFormCodeManager,
            ITherapyCodeManager therapyCodeManager, IFrequencyCodeManager frequencyCodeManager,
            IDrugRouteCodeManager drugRouteCodeManager, IDoseUnitCodeManager doseUnitCodeManager,
           IICDCodeCNManager icdCNCodeManager)
        {
            _prescriptionManager = pateientDataManager;
            _drugFormCodeManager = drugFormCodeManager;
            _therapyCodeManager = therapyCodeManager;
            _frequencyCodeManager = frequencyCodeManager;
            _drugRouteCodeManager = drugRouteCodeManager;
            _doseUnitCodeManager = doseUnitCodeManager;
            _icdCNCodeManager = icdCNCodeManager;
        }

        public async Task<long> CreatePrescription(PrescriptionCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            input.StatusCodeId = EMRConsts.ActiveStatus;
            await input.PrimaryCondition
                .Concat(input.SecondaryCondition).ToList()
                .ForEachAsync(async item =>
            {
                item.TenantId = input.TenantId;
                var codeExists = await _icdCNCodeManager.CheckCNExists(item);
                if (!codeExists)
                {
                    throw new UserFriendlyException("ICDCN code or Custom Code Could not be found");
                }
            });

            return await _prescriptionManager.CreatePrescriptionAsync(input);
        }
        public async Task UpdatePrescription(PrescriptionUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await _prescriptionManager.UpdatePrescriptionAsync(input);
        }
        public async Task<IEnumerable<PrescriptionResultDto>> GetPrescriptionDetail(PatientDataInputDto searchInput)
        {
            searchInput.TenantId = GetTenantId();
            return await _prescriptionManager.GetPrescriptionDetailAsync(searchInput);

        }

        public async Task<IEnumerable<PrescriptionTimeLineResultDto>> GetPrescriptionTimeLine(PatientDataInputDto searchInput)
        {
            searchInput.TenantId = GetTenantId();
            return await _prescriptionManager.GetPrescriptionTimeLineAsync(searchInput);
        }

        public async Task<List<DrugFormCode>> GetDrugFormCode()
        {
            return await _drugFormCodeManager.GetDrugFormCodeAsync();
        }

        public async Task<List<TherapyCode>> GetTherapyCode()
        {
            return await _therapyCodeManager.GetTherapyCodeAsync();
        }

        public async Task<List<FrequencyCode>> GetFrequencyCode()
        {
            return await _frequencyCodeManager.GetFrequencyCodeAsync();
        }

        public async Task<List<DrugRouteCode>> GetDrugRouteCode()
        {
            return await _drugRouteCodeManager.GetDrugRouteCodeAsync();
        }

        public async Task<List<DoseUnitCode>> GetDoseUnitCode()
        {
            return await _doseUnitCodeManager.GetDoseUnitCodeAsync();
        }
        public async Task<List<PrescriptionResultDto>> GetPrescriptionDetailByVisitIdAndPid(PatientVisitDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _prescriptionManager.GetPrescriptionDetailByVisitIdAndPidAsync(input);
        }
    }
}