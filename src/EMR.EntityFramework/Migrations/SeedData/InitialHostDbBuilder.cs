using EMR.EntityFramework;
using EntityFramework.DynamicFilters;

namespace EMR.Migrations.SeedData
{
    public class InitialHostDbBuilder
    {
        private readonly EMRDbContext _context;

        public InitialHostDbBuilder(EMRDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            _context.DisableAllFilters();

            new DefaultEditionsCreator(_context).Create();
            new DefaultLanguagesCreator(_context).Create();
            new HostRoleAndUserCreator(_context).Create();
            new DefaultSettingsCreator(_context).Create();
        }
    }
}
