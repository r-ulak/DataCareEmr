using System.Linq;
using EMR.AzureStorgae.BlobStorage;
using EMR.EntityFramework;
using EMR.MultiTenancy;

namespace EMR.Migrations.SeedData
{
    public class DefaultTenantCreator
    {
        private readonly EMRDbContext _context;
        private IBlobStorageService _blobStorageService;

        public DefaultTenantCreator(EMRDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            CreateUserAndRoles();
        }

        private void CreateUserAndRoles()
        {
            //Default tenant
            var blobConnection = new BlobConnection();
            _blobStorageService = new BlobStorageService(blobConnection);
            var defaultTenant = _context.Tenants.FirstOrDefault(t => t.TenancyName == Tenant.DefaultTenantName);
            if (defaultTenant == null)
            {
                _context.Tenants.Add(new Tenant { TenancyName = Tenant.DefaultTenantName, Name = Tenant.DefaultTenantName });
                for (int i = 2; i <= 15; i++)
                {
                    _context.Tenants.Add(new Tenant
                    {
                        TenancyName = "Hospital" + i,
                        Name = "Hospital" + i,
                        IsActive = true,
                        EditionId = 1
                    });
                    _blobStorageService.CreateContainerAsync(i.ToString()).Wait();
                    _context.SaveChanges();
                }

            }
        }
    }
}
