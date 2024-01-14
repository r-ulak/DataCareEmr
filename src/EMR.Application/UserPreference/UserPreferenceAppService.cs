using System.Threading.Tasks;
using Abp.Authorization;
using EMR.Authorization;
using EMR.Manager.Service;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Timing;
using EMR.DTO.Common;

namespace EMR.UserPreference
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class UserPreferenceAppService : EMRAppServiceBase, IUserPreferenceAppService
    {
        private readonly IUserPreferenceManager _userpreferenceManager;

        public UserPreferenceAppService(IUserPreferenceManager userpreferenceManager)
        {
            _userpreferenceManager = userpreferenceManager;
        }

        public async Task CreateUserPreference(UserPreferenceCreateDto input)
        {
            input.TenantId = GetTenantId();
            input.CreatedBy = input.UpdatedBy = GetLoggedUserId();
            input.CreateDate = input.UpdateDate = Clock.Now;
            await _userpreferenceManager.CreateUserPreferenceAsync(input);
        }

        public async Task<UserPreferenceResultDto> GetUserPreferenceDetailByid(SessionDto input)
        {
            input.TenantId = GetTenantId();
            if (input.LoggedUserId == 0)
            {
                input.LoggedUserId = GetLoggedUserId();
            }
            return await _userpreferenceManager.GetUserPreferenceByIdAsync(input);
        }

    }
}
