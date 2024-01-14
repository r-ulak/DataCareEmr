using Abp.AutoMapper;
using Abp.Dependency;
using EMR.DAL;
using EMR.DTO.Common;
using EMR.Entities;
using EMR.Helper;
using EMR.Roles.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EMR.DTO.RoleUser;
using Abp.Timing;
using Abp.UI;
using EMR.Users.Dto;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for AbpRoles
    /// </summary>
    public class AbpRolesManager : IAbpRolesManager, ISingletonDependency
    {
        private readonly IAbpRolesRepositoryExtended _abprolesRepositoryExtended;
        private readonly IAbpUserRolesRepositoryExtended _abpUserRolesRepositoryExtended;
        private readonly IAbpPermissionsRepositoryExtended _abpPermissionsRepositoryExtended;
        public AbpRolesManager(IAbpRolesRepositoryExtended abprolesRepositoryExtended,
            IAbpPermissionsRepositoryExtended abpPermissionsRepositoryExtended,
            IAbpUserRolesRepositoryExtended abpUserRolesRepositoryExtended
            )
        {
            _abprolesRepositoryExtended = abprolesRepositoryExtended;
            _abpPermissionsRepositoryExtended = abpPermissionsRepositoryExtended;
            _abpUserRolesRepositoryExtended = abpUserRolesRepositoryExtended;
        }
        public async Task<int> CreateRoleAsync(AbpRoles input)
        {
            return await _abprolesRepositoryExtended.InsertAsync(input);
        }

        public async Task CreatePermissionForRoleAsync(PermissionsResultDto input, RoleFilterInputDto roleInput)
        {
            await _abpPermissionsRepositoryExtended.InsertAsync(
                 AbpPermissions.Create(input.Name, input.IsGranted, Clock.Now, "RolePermissionSetting", roleInput.SessionInfo.LoggedUserId, roleInput.FilteredRoleId, null, roleInput.SessionInfo.TenantId));
        }

        public async Task CreateRoleAddedAsync(AddRoleInputDto input, long targetUserId, SessionDto session)
        {
            await _abpUserRolesRepositoryExtended.InsertAsync(
                 AbpUserRoles.Create(targetUserId,
                 input.RoleId, Clock.Now, session.LoggedUserId, session.TenantId));
        }
        public async Task UpdateRoleNameAsync(RoleFilterInputDto input)
        {
            var role = await _abprolesRepositoryExtended.GetByIdAsync(input.FilteredRoleId, input.SessionInfo.TenantId);
            if (input.RoleName != role.DisplayName
                || input.IsDefault != role.IsDefault)
            {
                role.LastModificationTime = Clock.Now;
                role.LastModifierUserId = input.SessionInfo.LoggedUserId;
                role.DisplayName = role.Name = input.RoleName;
                role.IsDefault = input.IsDefault;
                await _abprolesRepositoryExtended.UpdateAsync(role);
            }
        }

        public async Task<bool> CheckRoleNameExistsAsync(RoleFilterInputDto input)
        {
            if (string.IsNullOrEmpty(input.RoleName))
            {
                throw new UserFriendlyException("RoleName cannot be null or empty");
            }
            var role = await
                _abprolesRepositoryExtended.GetByNameAsync(input.RoleName, input.SessionInfo.TenantId);
            if (role.FirstOrDefault() == null) return false;
            if (role.Count(x => x.Id == input.FilteredRoleId) == 1)
            {
                return false;
            }
            return true;
        }

        public async Task UpdatePermissionsForRoleAsync(List<PermissionsResultDto> input, RoleFilterInputDto roleInput)
        {
            var currentPermissions = await _abpPermissionsRepositoryExtended.GetByRoleIdAsync(roleInput.FilteredRoleId, roleInput.SessionInfo.TenantId);

            var permissionUpdateNeeded = currentPermissions.Where(b => input.Any(a => a.Id == b.Id && a.IsGranted != b.IsGranted)).ToList();
            permissionUpdateNeeded.ForEach(c => c.IsGranted = !c.IsGranted);
            var permissionAddNeeded = input.Where(x => x.IsGranted == true & !currentPermissions.Any(a => a.Name == x.Name || a.Id == x.Id)).ToList();
            await permissionAddNeeded.ForEachAsync(async item => await CreatePermissionForRoleAsync(item, roleInput));
            await permissionUpdateNeeded.ForEachAsync(async item => await _abpPermissionsRepositoryExtended.UpdateAsync(item));

        }

        public async Task<List<PermissionsResultDto>> GetPermissionByRoleAsync(RoleFilterInputDto input)
        {
            if (input.FilteredRoleId != 0)
            {
                return (await _abpPermissionsRepositoryExtended.GetByRoleIdAsync(input.FilteredRoleId, input.SessionInfo.TenantId))
                .MapTo<List<PermissionsResultDto>>();
            }
            else
            {
                return (await _abpPermissionsRepositoryExtended.GetAllAsync(input.SessionInfo.TenantId))
                    .MapTo<List<PermissionsResultDto>>()
                    .Select(c => { c.IsGranted = false; return c; })
                    .OrderBy(o => o.Id)
                    .GroupBy(x => x.Name)
                    .Select(y => y.First()).ToList();
            }
        }

        public async Task<List<RoleResultDto>> GetRolesByPermissionAsyc(PermissionFilterInputDto input)
        {
            if (input.FilteredPermissionName == string.Empty)
            {
                return (await _abprolesRepositoryExtended.GetAllAsync(input.TenantId))
                .MapTo<List<RoleResultDto>>();
            }
            else
            {
                return (await _abprolesRepositoryExtended.GetRolesByPermission(input))
                    .MapTo<List<RoleResultDto>>();
            }
        }

        public async Task<List<PermissionsResultDto>> GetAlPermissionsAsync(int tenantId)
        {
            return (await _abpPermissionsRepositoryExtended.GetAllAsync(tenantId))
                      .MapTo<List<PermissionsResultDto>>()
                      .GroupBy(x => x.Name)
                      .Select(y => y.First()).ToList();
            ;
        }
        public async Task<List<RoleResultDto>> GetAllRolesAsync(int tenantId)
        {
            return (await _abprolesRepositoryExtended.GetAllAsync(tenantId))
                      .MapTo<List<RoleResultDto>>();
        }

        public async Task AddRemoveRolesForUserAsync(EditUserInput input)
        {
            var currentRoles = await _abpUserRolesRepositoryExtended
                .GetByUserIdAsync(input.UserId, input.SessionInfo.TenantId);

            var roleRemoveNeeded = currentRoles.Where(b =>
            !input.Roles.Any(a => a == b.RoleId)).ToList();
            var roleAddNeeded = input.Roles.Where(b =>
            !currentRoles.Any(a => a.RoleId == b)).ToList();

            await roleAddNeeded.ForEachAsync(async item => await
            CreateRoleAddedAsync(new AddRoleInputDto()
            {
                RoleId = item,
                IsGranted = true
            }, input.UserId, input.SessionInfo));

            await roleRemoveNeeded.ForEachAsync(async item => await
            _abpUserRolesRepositoryExtended
            .DeleteAbpUserRole(item, input.SessionInfo.TenantId));

        }

        public async Task<List<PermissionsTreeViewDto>> GetPermissionTreeAsync(RoleFilterInputDto input)
        {
            var permissions = (await GetPermissionByRoleAsync(input));
            List<PermissionsResultDto> allPermissions;
            if (input.FilteredRoleId != 0)
            {
                allPermissions = (await GetPermissionByRoleAsync(
                   new RoleFilterInputDto()
                   {
                       FilteredRoleId = 0,
                       SessionInfo = new SessionDto()
                       {
                           TenantId = input.SessionInfo.TenantId
                       }
                   }
                    ));
                foreach (var item in allPermissions)
                {
                    var selectedId = permissions.FirstOrDefault(y => y.Name == item.Name);
                    if (selectedId != null)
                    {
                        item.IsGranted = selectedId.IsGranted;
                        item.Id = selectedId.Id;
                    }
                }
                return GenerateTreeForPermission(allPermissions);
            }
            else
            {
                return GenerateTreeForPermission(permissions);

            }
        }

        public async Task<List<RoleResultDto>> GetRoleByUserIdAsync(UserRoleInputDto input)
        {
            return (await _abpUserRolesRepositoryExtended
                .GetRolesByUserId(input))
                .MapTo<List<RoleResultDto>>();
        }
        public async Task<RoleResultDto> GetRoleByIdAsync(RoleFilterInputDto input)
        {
            return (await _abprolesRepositoryExtended
                .GetByIdAsync(input.FilteredRoleId, input.SessionInfo.TenantId))
                .MapTo<RoleResultDto>();
        }

        public List<PermissionsTreeViewDto> GenerateTreeForPermission(List<PermissionsResultDto> permissionCollection)
        {
            var root = new PermissionsTreeViewDto { Children = new List<PermissionsTreeViewDto>() };
            //order so parent are lsited first
            permissionCollection.Sort((el1, el2) => el1.Name.Count(c => c == '.') - el2.Name.Count(c => c == '.'));

            foreach (var el in permissionCollection)
            {
                var path = el.Name.Split('.');
                var parent = root;
                int last = path.Length - 1;
                for (int i = 0; i < last; i++)
                {
                    parent = PermissionsTreeViewDto.Find(parent, path[i]);
                }
                parent = parent ?? new PermissionsTreeViewDto { Children = new List<PermissionsTreeViewDto>() };
                parent.Children.Add(new PermissionsTreeViewDto
                {
                    Text = path[last],
                    Id = el.Id,
                    Children = new List<PermissionsTreeViewDto>(),
                    Data = el.Name,
                    State = new TreeState()
                    {
                        Disabled = false,
                        Opened = true,
                        Selected = el.IsGranted
                    }
                });
            }
            return root.Children;
        }
    }
}
