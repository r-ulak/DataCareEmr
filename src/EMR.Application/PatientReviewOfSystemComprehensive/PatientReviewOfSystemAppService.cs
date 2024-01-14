using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using Castle.Core.Internal;
using System;

namespace EMR.PatientReviewOfSystem
{
    [AbpAuthorize(PermissionNames.PagesVisitWorkFlow)]
    public class PatientReviewOfSystemAppService : EMRAppServiceBase, IPatientReviewOfSystemAppService
    {
        private readonly IPatientReviewOfSystemManager _patientreviewofsystemManager;
        private readonly IReviewOfSystemCodeManager _reviewofsystemManager;

        public PatientReviewOfSystemAppService(IPatientReviewOfSystemManager
            patientreviewofsystemManager,
             IReviewOfSystemCodeManager reviewofsystemManager

            )
        {
            _reviewofsystemManager = reviewofsystemManager;
            _patientreviewofsystemManager = patientreviewofsystemManager;
        }

        public async Task CreatePatientReviewOfSystem(CreatePatientReviewOfSystemDto input)
        {
            input.ReviewOfSystem.ForEach(x =>
            {
                x.TenantId = GetTenantId();
                x.CreatedBy = GetLoggedUserId();
                x.CreateDate = Clock.Now;
            });

            await _patientreviewofsystemManager.CreatePatientReviewOfSystemAsync(input);
        }

        public async Task<List<PatientReviewOfSystemResultDto>> GetPatientReviewOfSystemDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _patientreviewofsystemManager.GetPatientReviewOfSystemDetailByPidAsync(input);
        }

        public async Task<List<ReviewOfSystemGroupedCodeResultDto>> GetPatientReviewOfSystemDetailByVisitIdAndPid(PatientReviewOfSystemnputDto input)
        {
            input.TenantId = GetTenantId();
            return await _patientreviewofsystemManager.GetPatientReviewOfSystemDetailByVisitIdAndPidAsync(input);
        }

        public async Task<List<ReviewOfSystemGroupedCodeResultDto>> GetAllReviewOfSystemCode()
        {
            return await _reviewofsystemManager.GetAllReviewOfSystemCodeAsync();
        }


    }
}
