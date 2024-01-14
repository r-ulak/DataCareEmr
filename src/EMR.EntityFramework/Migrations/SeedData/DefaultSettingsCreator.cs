using System.Linq;
using Abp.Configuration;
using Abp.Localization;
using Abp.Net.Mail;
using EMR.Configuration;
using EMR.EntityFramework;

namespace EMR.Migrations.SeedData
{
    public class DefaultSettingsCreator
    {
        private readonly EMRDbContext _context;

        public DefaultSettingsCreator(EMRDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            //Emailing
            AddSettingIfNotExists(EmailSettingNames.DefaultFromAddress, "datacare@emr.com");
            AddSettingIfNotExists(EmailSettingNames.DefaultFromDisplayName, "datacare@emr.com DataCare");
            AddSettingIfNotExists(EmailSettingNames.Smtp.Host, "smtp.sendgrid.net");
            AddSettingIfNotExists(EmailSettingNames.Smtp.Port, "587");
            AddSettingIfNotExists(EmailSettingNames.Smtp.UserName, "azure_2f04afc3afd9fbcd4898f4e926c8e527@azure.com");
            AddSettingIfNotExists(EmailSettingNames.Smtp.Password, "6MQlrg1W8Zh1w60");
            AddSettingIfNotExists(EmailSettingNames.Smtp.EnableSsl, "false");
            AddSettingIfNotExists(EmailSettingNames.Smtp.UseDefaultCredentials, "false");

            //Languages
            AddSettingIfNotExists(LocalizationSettingNames.DefaultLanguage, "en");

            //Azure Search
            AddSettingIfNotExists(EMRSettingNames.EmrSearchServiceName, "emrsearchservice");
            AddSettingIfNotExists(EMRSettingNames.EmrSearchServiceApiKeyAdmin, "1A18F7FEC69D21702E25985583DF295B");
            AddSettingIfNotExists(EMRSettingNames.EmrSearchServiceApiKeyQuery, "6771E5D30FDB5A3A0BE3C6EA63FD8289");
            //Azure Blob
            AddSettingIfNotExists(EMRSettingNames.EmrBlobCacheDuration, "3600");

            //CalendarDayRange
            AddSettingIfNotExists(EMRSettingNames.EmrCalendarLowerDayRange, "-16");
            AddSettingIfNotExists(EMRSettingNames.EmrCalendarUpperDayRange, "16");

            //PageSize
            AddSettingIfNotExists(EMRSettingNames.PatientSearchResultPageSize, "10");
            AddSettingIfNotExists(EMRSettingNames.ActiveVisitResultPageSize, "20");
            AddSettingIfNotExists(EMRSettingNames.AuditLogResultPageSize, "25");
        }

        private void AddSettingIfNotExists(string name, string value, int? tenantId = null)
        {
            if (_context.Settings.Any(s => s.Name == name && s.TenantId == tenantId && s.UserId == null))
            {
                return;
            }

            _context.Settings.Add(new Setting(tenantId, null, name, value));
            _context.SaveChanges();
        }
    }
}