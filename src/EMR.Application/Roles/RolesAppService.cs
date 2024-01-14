using Abp.Authorization;
using Abp.AutoMapper;
using Abp.Timing;
using EMR.Authorization;
using EMR.DTO.Common;
using EMR.DTO.RoleUser;
using EMR.Entities;
using EMR.Manager.Service;
using EMR.Roles.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;
using EMR.Helper;
using Abp.UI;

namespace EMR.AbpRoleService
{
    [AbpAuthorize(PermissionNames.PagesUsers)]
    public class RolesAppService : EMRAppServiceBase, IRolesAppService
    {
        private readonly IAbpRolesManager _abprolesManager;

        public RolesAppService(IAbpRolesManager abprolesManager)
        {
            _abprolesManager = abprolesManager;
        }
        public async Task CreateRole(CreateRoleInput input)
        {
            var role = input.MapTo<AbpRoles>();
            role.TenantId = GetTenantId();
            role.CreatorUserId = GetLoggedUserId();
            role.CreationTime = Clock.Now;

            var roleId = await _abprolesManager.CreateRoleAsync(role);
            var roleInput = new RoleFilterInputDto()
            {
                FilteredRoleId = roleId,
                SessionInfo = new SessionDto()
                {
                    TenantId = GetTenantId(),
                    LoggedUserId = GetLoggedUserId()

                }
            };

            await input.PermissionInput.ForEachAsync(async item => await
            _abprolesManager.CreatePermissionForRoleAsync(item, roleInput));
        }

        public async Task<List<RoleResultDto>> GetRolesByPermission(PermissionFilterInputDto input)
        {
            input.TenantId = GetTenantId();
            return await _abprolesManager.GetRolesByPermissionAsyc(input);
        }

        public async Task<List<PermissionsResultDto>> GetPermissionByRole(RoleFilterInputDto input)
        {
            input.SessionInfo = new SessionDto()
            {
                TenantId = GetTenantId()
            };

            return await _abprolesManager.GetPermissionByRoleAsync(input);
        }

        public async Task UpsertPermissionForRole(UpsertPermissonsDto input)
        {
            input.RoleFilterInput.SessionInfo = new SessionDto()
            {
                TenantId = GetTenantId(),
                LoggedUserId = GetLoggedUserId()
            };

            if ((await _abprolesManager.CheckRoleNameExistsAsync(input.RoleFilterInput)))
            {
                throw new UserFriendlyException("RoleName already exists");
            }
            await _abprolesManager.UpdateRoleNameAsync(input.RoleFilterInput);
            await _abprolesManager.UpdatePermissionsForRoleAsync(
                   input.PermissionInput,
                   input.RoleFilterInput);
        }

        public async Task<List<RoleResultDto>> GetAllRoles()
        {
            return await _abprolesManager.GetAllRolesAsync(GetTenantId());
        }
        public async Task<List<PermissionsResultDto>> GetAllPermissions()
        {
            return await _abprolesManager.GetAlPermissionsAsync(GetTenantId());
        }

        public async Task<List<PermissionsTreeViewDto>> GetPermissionTreeByRole(RoleFilterInputDto input)
        {
            input.SessionInfo = new SessionDto()
            {
                TenantId = GetTenantId(),

            };

            return await _abprolesManager.GetPermissionTreeAsync(input);
        }

        public async Task<RoleResultDto> GetRoleById(RoleFilterInputDto input)
        {
            input.SessionInfo = new SessionDto()
            {
                TenantId = GetTenantId()
            };

            return await _abprolesManager.GetRoleByIdAsync(input);
        }
    }
}
