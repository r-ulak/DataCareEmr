using System.Data.Entity.Migrations;
using Abp.MultiTenancy;
using Abp.Zero.EntityFramework;
using EMR.Migrations.SeedData;
using EntityFramework.DynamicFilters;

namespace EMR.Migrations
{
    public sealed class Configuration : DbMigrationsConfiguration<EMR.EntityFramework.EMRDbContext>, IMultiTenantSeed
    {
        public AbpTenantBase Tenant { get; set; }

        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            ContextKey = "EMR";
        }

        protected override void Seed(EMR.EntityFramework.EMRDbContext context)
        {
            context.DisableAllFilters();

            if (Tenant == null)
            {
                //Host seed
                new InitialHostDbBuilder(context).Create();

                //Default tenant seed (in host database).
                new DefaultTenantCreator(context).Create();
                for (int i = 1; i <= 15; i++)
                {
                    new TenantRoleAndUserBuilder(context, i).Create();

                }
            }
            else
            {
                //You can add seed for tenant databases and use Tenant property...
            }

            context.SaveChanges();
        }
    }
}
