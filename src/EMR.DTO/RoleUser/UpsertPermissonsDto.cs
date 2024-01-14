using EMR.Roles.Dto;
using System.Collections.Generic;

namespace EMR.DTO.RoleUser
{
    public class UpsertPermissonsDto
    {
        public List<PermissionsResultDto> PermissionInput { get; set; }
        public RoleFilterInputDto RoleFilterInput { get; set; }
    }
}
