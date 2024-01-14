using System;
using System.Data.Common;
using Abp.Zero.EntityFramework;
using EMR.Authorization.Roles;
using EMR.MultiTenancy;
using EMR.Users;
using System.Data.Entity;
using EMR.Entities;

namespace EMR.EntityFramework
{
    public class EMRDbContext : AbpZeroDbContext<Tenant, Role, User>
    {
        //TODO: Define an IDbSet for your Entities...

        /* NOTE: 
         *   Setting "Default" to base class helps us when working migration commands on Package Manager Console.
         *   But it may cause problems when working Migrate.exe of EF. If you will apply migrations on command line, do not
         *   pass connection string name to base classes. ABP works either way.
         */
        private static string _environmentConnectionString;

        public EMRDbContext()
            : base(GetConnectionName())
        {

        }

        /* NOTE:
         *   This constructor is used by ABP to pass connection string defined in EMRDataModule.PreInitialize.
         *   Notice that, actually you will not directly create an instance of EMRDbContext since ABP automatically handles it.
         */
        public EMRDbContext(string nameOrConnectionString)
            : base(nameOrConnectionString)
        {

        }

        private static string GetConnectionName()
        {
            if (!string.IsNullOrEmpty(_environmentConnectionString)) return _environmentConnectionString;
            _environmentConnectionString = Environment.GetEnvironmentVariable("ConnectionString");
            if (string.IsNullOrEmpty(_environmentConnectionString))
            {
                _environmentConnectionString = "Default";
            }
            return _environmentConnectionString;
        }
        //This constructor is used in tests
        public EMRDbContext(DbConnection connection)
            : base(connection, true)
        {

        }
    }
}
