using System.Collections.Generic;
using Abp.Configuration;


namespace EMR.Configuration
{
    public class EMRSettingProvider : SettingProvider
    {
        public override IEnumerable<SettingDefinition> GetSettingDefinitions(SettingDefinitionProviderContext context)
        {
            return new[]
            {
                new SettingDefinition(
                    EMRSettingNames.PatientSearchResultPageSize,
                    "10",
                    isVisibleToClients: true
                ),
                new SettingDefinition(
                    EMRSettingNames.ActiveVisitResultPageSize,
                    "20",
                    isVisibleToClients: true
                ),
                new SettingDefinition(
                    EMRSettingNames.AuditLogResultPageSize,
                    "25",
                    isVisibleToClients: true
                ),
                new SettingDefinition(
                    EMRSettingNames.EmrSearchServiceName,
                    "",
                    isVisibleToClients: false
                    , scopes: SettingScopes.Application
                ),
                new SettingDefinition(
                    EMRSettingNames.EmrSearchServiceApiKeyAdmin,
                    "",
                    isVisibleToClients: false
                    , scopes: SettingScopes.Application
                ),
                new SettingDefinition(
                    EMRSettingNames.EmrSearchServiceApiKeyQuery,
                    "",
                    isVisibleToClients: false
                    , scopes: SettingScopes.Application
                ),
                new SettingDefinition(
                    EMRSettingNames.EmrBlobCacheDuration,
                    "",
                    isVisibleToClients: false
                    , scopes: SettingScopes.Application
                ),
                    new SettingDefinition(
                    EMRSettingNames.EmrCalendarLowerDayRange,
                    "",
                    isVisibleToClients: false
                    , scopes: SettingScopes.Application
                ),
                    new SettingDefinition(
                    EMRSettingNames.EmrCalendarUpperDayRange,
                    "",
                    isVisibleToClients: false
                    , scopes: SettingScopes.Application
                ),
            };
        }
    }
}
