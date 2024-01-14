using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.Common;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for UserPreference
    /// </summary>
    public class UserPreferenceManager : IUserPreferenceManager, ISingletonDependency
    {
        private readonly IUserPreferenceRepositoryExtended _userpreferenceRepositoryExtended;
        public UserPreferenceManager(IUserPreferenceRepositoryExtended userpreferenceRepositoryExtended)
        {
            _userpreferenceRepositoryExtended = userpreferenceRepositoryExtended;
        }
        public async Task CreateUserPreferenceAsync(UserPreferenceCreateDto input)
        {
            await _userpreferenceRepositoryExtended.InsertAsync(input.MapTo<UserPreference>());
        }

        public async Task<UserPreferenceResultDto> GetUserPreferenceByIdAsync(
            SessionDto input)
        {
            return 
               ( await _userpreferenceRepositoryExtended
               .GetByIdAsync(input.LoggedUserId, input.TenantId)).MapTo<UserPreferenceResultDto>();
        }

     }
}
