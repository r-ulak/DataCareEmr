using Abp.Application.Services;
using EMR.DTO.Common;
using EMR.DTO.RoleUser;
using EMR.Roles.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EMR.AbpRoleService
{
    public interface IRolesAppService : IApplicationService
    {
        Task CreateRole(CreateRoleInput input);

        Task<List<RoleResultDto>> GetRolesByPermission(PermissionFilterInputDto input);
        Task<List<PermissionsResultDto>> GetPermissionByRole(RoleFilterInputDto input);
        Task UpsertPermissionForRole(UpsertPermissonsDto input);
        int GetTenantId();
        long GetLoggedUserId();
        Task<List<RoleResultDto>> GetAllRoles();
        Task<List<PermissionsTreeViewDto>> GetPermissionTreeByRole(RoleFilterInputDto input);
        Task<RoleResultDto> GetRoleById(RoleFilterInputDto input);
        Task<List<PermissionsResultDto>> GetAllPermissions();

    }
}
