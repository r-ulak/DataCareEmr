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
    public class ICD10PCSIndexer : IAzureSearchIndexType
    {
        private readonly ISettingManager _settingManager;
        private readonly IPermissionChecker _permissionChecker;
        private readonly IAzureSearchClientFactory _azureSearchClientFactory;

        public string JobName { get; }
        public string IndexName { get; }
        public string SuggesterName { get; }


        public ICD10PCSIndexer(ISettingManager settingManager, IPermissionChecker permissionChecker,
            IAzureSearchClientFactory azureSearchClientFactory)
        {
            _settingManager = settingManager;
            _permissionChecker = permissionChecker;
            _azureSearchClientFactory = azureSearchClientFactory;
            JobName = "azuresearch icd10pcs index";
            SuggesterName = EMRConsts.EMRAzureIndexNameICD10PCS;
            IndexName = EMRConsts.EMRAzureIndexNameICD10PCS;
        }

        public AzureDataIndexer GetDataIndexer(UserIdentifier user)
        {
            if (!_permissionChecker.IsGranted(user, PermissionNames.PagesHostOnlyJobsICD10PCSIndex))
            {
                throw new SecurityException(
                    $"Unauthoized Access for {PermissionNames.PagesHostOnlyJobsICD10PCSIndex}");
            }
            ;

            return new AzureDataIndexer()
            {
                DataSource = $"{EMRConsts.EMRAzureIndexNameICD10PCS}-datasource",
                Description = "ICD10 Procedueral Code",
                IndexName = EMRConsts.EMRAzureIndexNameICD10PCS,
                Indexer = $"{EMRConsts.EMRAzureIndexNameICD10PCS}-indexer",
                TableName = EMRConsts.EMRAzureIndexNameICD10PCS,
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
                    Name = EMRConsts.EMRAzureIndexNameICD10PCS,
                    Fields = new[]
                    {
                        new Field("ICDCodePCSId", DataType.String)
                        {
                            IsKey = true,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = true,
                            IsFacetable = false,
                            IsRetrievable = true
                        },
                        new Field("ICDCodePCSName", DataType.String)
                        {
                            IsKey = false,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = false,
                            IsFacetable = false,
                            IsRetrievable = true
                        },
                        new Field("ICDCodePCSShortName", DataType.String)
                        {
                            IsKey = false,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = false,
                            IsFacetable = false,
                            IsRetrievable = true
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
                            SourceFields = new List<string>() {"ICDCodePCSName", "ICDCodePCSId", "ICDCodePCSShortName" }
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
                    EMRConsts.EMRAzureIndexNameICD10PCS,
                   _settingManager.GetSettingValue(EMRSettingNames.EmrSearchServiceApiKeyQuery)
                );
        }
        public SuggestParameters GetAutoCompleteSearchParameters(AzureSearchInputDto input)
        {
            return
                new SuggestParameters()
                {
                    Filter = $"TenantId eq null or TenantId eq {input.TenantId}",
                    Select = new[] { "ICDCodePCSId", "ICDCodePCSName" },
                    UseFuzzyMatching = true,
                    Top = input.Limit
                };
        }

    }
}
