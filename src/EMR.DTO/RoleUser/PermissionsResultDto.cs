using Abp.AutoMapper;
using System;
using EMR.Entities;

namespace EMR.Roles.Dto
{
    [AutoMapFrom(typeof(AbpPermissions))]
    public class PermissionsResultDto : IEquatable<PermissionsResultDto>
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public bool IsGranted { get; set; }
        public bool Equals(PermissionsResultDto other)

        {

            if (Object.ReferenceEquals(other, null)) return false;
            if (Object.ReferenceEquals(this, other)) return true;

            // Check whether the objects’ properties are equal.

            return Id.Equals(other.Id) &&
                   Name.Equals(other.Name);
        }


        public override int GetHashCode()

        {
            int hashTextual = Name == null ? 0 : Name.GetHashCode();

            int hashDigital = Id.GetHashCode();

            return hashDigital ^ hashTextual;

        }
    }
}