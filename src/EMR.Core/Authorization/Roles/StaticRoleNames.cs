using System.Collections.Generic;
using System.Security.AccessControl;

namespace EMR.Authorization.Roles
{
    public static class StaticRoleNames
    {
        public static class Host
        {
            public const string Admin = "Admin";
        }

        public static class Tenants
        {
            public const string Admin = "Admin";
            public const string Doctor = "Doctor";
            public const string Nurse = "Nurse";
            public const string Reception = "Reception";
            public const string Pharmacist = "Pharmacist";
            public const string Radiologist = "Radiologist";
            public const string LabTechnician = "LabTechnician";
        }

        public class DefaultRolePermissions
        {
            public string PermissionName { get; set; }
            public bool Admin { get; set; }
            public bool Doctor { get; set; }
            public bool Nurse { get; set; }
            public bool Reception { get; set; }
            public bool Pharmacist { get; set; }
            public bool Radiologist { get; set; }
            public bool LabTechnician { get; set; }
            public List<string> Roles { get; set; }

            public DefaultRolePermissions(string permissionName, bool admin = true, bool doctor = false, bool nurse = false, bool reception = false, bool pharmacist = false, bool radiologist = false, bool labTechnician = false)
            {
                PermissionName = permissionName;
                Admin = admin;
                Doctor = doctor;
                Nurse = nurse;
                Reception = reception;
                Pharmacist = pharmacist;
                Radiologist = radiologist;
                LabTechnician = labTechnician;
                Roles = new List<string>();
                if (Admin)
                    Roles.Add(Tenants.Admin);
                if (Doctor)
                    Roles.Add(Tenants.Doctor);
                if (Nurse)
                    Roles.Add(Tenants.Nurse);
                if (Reception)
                    Roles.Add(Tenants.Reception);
                if (Pharmacist)
                    Roles.Add(Tenants.Pharmacist);
                if (Radiologist)
                    Roles.Add(Tenants.Radiologist);
                if (LabTechnician)
                    Roles.Add(Tenants.LabTechnician);
            }
        }
    }
}