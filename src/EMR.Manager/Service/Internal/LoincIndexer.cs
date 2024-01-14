using System;
using System.Collections.Generic;
using System.Security;
using Abp;
using Abp.Authorization;
using Abp.Configuration;
using EMR.Authorization;
using EMR.AzureSearchIndexer;
using EMR.Configuration;
using EMR.DTO.Common;
using Microsoft.Azure.Search;
using Microsoft.Azure.Search.Models;

namespace EMR.Manager.Service.Internal
{
    public class LoincIndexer : IAzureSearchIndexType
    {
        private readonly ISettingManager _settingManager;
        private readonly IPermissionChecker _permissionChecker;
        private readonly IAzureSearchClientFactory _azureSearchClientFactory;

        public string JobName { get; }
        public string IndexName { get; }
        public string SuggesterName { get; }


        public LoincIndexer(ISettingManager settingManager, IPermissionChecker permissionChecker,
            IAzureSearchClientFactory azureSearchClientFactory)
        {
            _settingManager = settingManager;
            _permissionChecker = permissionChecker;
            _azureSearchClientFactory = azureSearchClientFactory;
            JobName = "azuresearch loinc index";
            SuggesterName = EMRConsts.EMRAzureIndexNameLoinc;
            IndexName = EMRConsts.EMRAzureIndexNameLoinc;
        }

        public AzureDataIndexer GetDataIndexer(UserIdentifier user)
        {
            if (!_permissionChecker.IsGranted(user, PermissionNames.PagesHostOnlyJobsLoincIndex))
            {
                throw new SecurityException(
                    $"Unauthoized Access for {PermissionNames.PagesHostOnlyJobsLoincIndex}");
            }
            ;

            return new AzureDataIndexer()
            {
                DataSource = $"{EMRConsts.EMRAzureIndexNameLoinc}-datasource",
                Description = "Loinc Code",
                IndexName = EMRConsts.EMRAzureIndexNameLoinc,
                Indexer = $"{EMRConsts.EMRAzureIndexNameLoinc}-indexer",
                TableName = EMRConsts.EMRAzureIndexNameLoinc,
                Schedule = new IndexingSchedule()
                {
                    Interval = new TimeSpan(1, 0, 0),
                },
                Settings = new AzureDataIndexerSettings()
                {
                    ServiceName = _settingManager.GetSettingValue(EMRSettingNames.EmrSearchServiceName),
                    ApiKey = _settingManager.GetSettingValue(EMRSettingNames.EmrSearchServiceApiKeyAdmin)
                },
                Definition = new Index()
                {
                    Name = EMRConsts.EMRAzureIndexNameLoinc,
                    Fields = new[]
                    {
                        new Field("LoincCodeId", DataType.String)
                        {
                            IsKey = true,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = true,
                            IsFacetable = false,
                            IsRetrievable = true
                        },
                        new Field("LongCommonName", DataType.String)
                        {
                            IsKey = false,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = false,
                            IsFacetable = false,
                            IsRetrievable = true
                        },
                        new Field("RelatedNames", DataType.String)
                        {
                            IsKey = false,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = false,
                            IsFacetable = false,
                            IsRetrievable = false
                        },
                        new Field("TenantId", DataType.Int32)
                        {
                            IsKey = false,
                            IsSearchable = false,
                            IsFilterable = true,
                            IsSortable = false,
                            IsFacetable = false,
                            IsRetrievable = true
                        }
                    },
                    Suggesters = new[]
                    {
                        new Suggester()
                        {
                            Name = SuggesterName,
                            SearchMode = SuggesterSearchMode.AnalyzingInfixMatching,
                            SourceFields = new List<string>() { "LoincCodeId", "RelatedNames", "LongCommonName" }
                        },
                    }
                }
            };
        }

        public ISearchIndexClient GetSearchIndexClient()
        {
            return
                _azureSearchClientFactory.CreateSearchIndexClient(
                    _settingManager.GetSettingValue(EMRSettingNames.EmrSearchServiceName),
                    EMRConsts.EMRAzureIndexNameLoinc,
                   _settingManager.GetSettingValue(EMRSettingNames.EmrSearchServiceApiKeyQuery)
                );
        }
        public SuggestParameters GetAutoCompleteSearchParameters(AzureSearchInputDto input)
        {
            return
                new SuggestParameters()
                {
                    Filter = $"TenantId eq null or TenantId eq {input.TenantId}",
                    Select = new[] { "LoincCodeId", "LongCommonName" },
                    UseFuzzyMatching = true,
                    Top = input.Limit
                };
        }

    }
}
