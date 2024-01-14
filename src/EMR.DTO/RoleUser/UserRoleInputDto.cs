using EMR.DTO.Common;

namespace EMR.DTO.RoleUser
{
    public class UserRoleInputDto
    {
        public long UserId { get; set; }
        public SessionDto SessionInfo { get; set; }
    }
}
