using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using Abp.Timing;
using EMR.Entities;

namespace EMR.LifeStyle
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class LifeStyleAppService : EMRAppServiceBase, ILifeStyleAppService
    {
        private readonly ILifeStyleManager _lifestyleManager;

        public LifeStyleAppService(ILifeStyleManager lifestyleManager)
        {
            _lifestyleManager = lifestyleManager;
        }
        
        public async Task<long> CreateLifeStyle(LifeStyleCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            return await _lifestyleManager.CreateLifeStyleAsync(input);
        }
        
        public async Task UpdateLifeStyle(LifeStyleUpdateDto input)
        {
            input.TenantId = GetTenantId();
            input.UpdatedBy = GetLoggedUserId();
            input.UpdateDate = Clock.Now;
            await  _lifestyleManager.UpdateLifeStyleAsync(input);
        }

       public async Task<List<LifeStyleResultDto>> GetLifeStyleDetailByPid(PatientDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _lifestyleManager.GetLifeStyleDetailByPidAsync(input);
        }

        public async Task<List<LifeStyleType>> GetLifeStyleCode()
        {
            return await _lifestyleManager.GetLifeStyleCodeAsync();
        }
        public async Task<List<LifeStyleResultDto>> GetLifeStyleDetailByVisitIdAndPid(PatientVisitDataInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _lifestyleManager.GetLifeStyleDetailByVisitIdAndPidAsync(input);
        }
    }
}
