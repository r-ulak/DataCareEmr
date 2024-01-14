using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.Roles.Dto;
using EMR.Entities;
using EMR.DTO.Common;
using EMR.DTO.RoleUser;
using EMR.Users.Dto;

namespace EMR.Manager.Service
{
    public interface IAbpRolesManager
    {
        Task<List<RoleResultDto>> GetAllRolesAsync(int tenantId);
        Task<List<RoleResultDto>> GetRolesByPermissionAsyc(PermissionFilterInputDto input);
        Task<int> CreateRoleAsync(AbpRoles input);
        Task<List<PermissionsResultDto>> GetPermissionByRoleAsync(RoleFilterInputDto input);
        Task UpdatePermissionsForRoleAsync(List<PermissionsResultDto> input, RoleFilterInputDto roleInput);
        Task AddRemoveRolesForUserAsync(EditUserInput input);
        Task CreatePermissionForRoleAsync(PermissionsResultDto input, RoleFilterInputDto roleInput);
        Task CreateRoleAddedAsync(AddRoleInputDto input, long targetUserId, SessionDto session);
        Task<List<PermissionsTreeViewDto>> GetPermissionTreeAsync(RoleFilterInputDto input);
        List<PermissionsTreeViewDto> GenerateTreeForPermission(List<PermissionsResultDto> permissionCollection);
        Task<RoleResultDto> GetRoleByIdAsync(RoleFilterInputDto input);
        Task<bool> CheckRoleNameExistsAsync(RoleFilterInputDto input);
        Task UpdateRoleNameAsync(RoleFilterInputDto input);
        Task<List<PermissionsResultDto>> GetAlPermissionsAsync(int tenantId);
        Task<List<RoleResultDto>> GetRoleByUserIdAsync(UserRoleInputDto input);

    }
}
