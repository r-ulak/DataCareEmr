using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.Common;

namespace EMR.UserPreference
{
    public interface IUserPreferenceAppService : IApplicationService
    {
        Task CreateUserPreference(UserPreferenceCreateDto input);
        Task<UserPreferenceResultDto> GetUserPreferenceDetailByid(SessionDto input);
    }
}
