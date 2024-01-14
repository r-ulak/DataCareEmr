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
    public class ICD10CNIndexer : IAzureSearchIndexType
    {
        private readonly ISettingManager _settingManager;
        private readonly IPermissionChecker _permissionChecker;
        private readonly IAzureSearchClientFactory _azureSearchClientFactory;

        public string JobName { get; }
        public string IndexName { get; }
        public string SuggesterName { get; }


        public ICD10CNIndexer(ISettingManager settingManager, IPermissionChecker permissionChecker,
            IAzureSearchClientFactory azureSearchClientFactory)
        {
            _settingManager = settingManager;
            _permissionChecker = permissionChecker;
            _azureSearchClientFactory = azureSearchClientFactory;
            JobName = "azuresearch icd10cn index";
            SuggesterName = EMRConsts.EMRAzureIndexNameICD10CN;
            IndexName = EMRConsts.EMRAzureIndexNameICD10CN;
        }

        public AzureDataIndexer GetDataIndexer(UserIdentifier user)
        {
            if (!_permissionChecker.IsGranted(user, PermissionNames.PagesHostOnlyJobsICD10CNIndex))
            {
                throw new SecurityException(
                    $"Unauthoized Access for {PermissionNames.PagesHostOnlyJobsICD10CNIndex}");
            }
            ;

            return new AzureDataIndexer()
            {
                DataSource = $"{EMRConsts.EMRAzureIndexNameICD10CN}-datasource",
                Description = "ICD10 Procedueral Code",
                IndexName = EMRConsts.EMRAzureIndexNameICD10CN,
                Indexer = $"{EMRConsts.EMRAzureIndexNameICD10CN}-indexer",
                TableName = EMRConsts.EMRAzureIndexNameICD10CN,
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
                    Name = EMRConsts.EMRAzureIndexNameICD10CN,
                    Fields = new[]
                    {
                        new Field("ICDCodeCNId", DataType.String)
                        {
                            IsKey = true,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = true,
                            IsFacetable = false,
                            IsRetrievable = true
                        },
                        new Field("ICDCodeCNName", DataType.String)
                        {
                            IsKey = false,
                            IsSearchable = true,
                            IsFilterable = true,
                            IsSortable = false,
                            IsFacetable = false,
                            IsRetrievable = true
                        },
                        new Field("ICDCodeCNShortName", DataType.String)
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
                            SourceFields = new List<string>() {"ICDCodeCNName", "ICDCodeCNId", "ICDCodeCNShortName" }
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
                    EMRConsts.EMRAzureIndexNameICD10CN,
                   _settingManager.GetSettingValue(EMRSettingNames.EmrSearchServiceApiKeyQuery)
                );
        }
        public SuggestParameters GetAutoCompleteSearchParameters(AzureSearchInputDto input)
        {
            return
                new SuggestParameters()
                {
                    Filter = $"TenantId eq null or TenantId eq {input.TenantId}",
                    Select = new[] { "ICDCodeCNId", "ICDCodeCNName" },
                    UseFuzzyMatching = true,
                    Top = input.Limit
                };
        }

    }
}
