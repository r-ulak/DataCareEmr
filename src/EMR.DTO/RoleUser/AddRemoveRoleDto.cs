using EMR.DTO.Common;
using EMR.Roles.Dto;
using System.Collections.Generic;

namespace EMR.DTO.RoleUser
{
    public class AddRemoveRoleDto
    {
        public List<AddRoleInputDto> RoleInput { get; set; }
        public SessionDto Session { get; set; }
        public long TargetUserId { get; set; }
    }
}
