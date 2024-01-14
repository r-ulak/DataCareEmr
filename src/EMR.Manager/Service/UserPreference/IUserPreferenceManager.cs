using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.Common;

namespace EMR.Manager.Service
{
    public interface IUserPreferenceManager
    {
        Task CreateUserPreferenceAsync(UserPreferenceCreateDto input);
        Task<UserPreferenceResultDto> GetUserPreferenceByIdAsync(
                 SessionDto input);
   }
}
