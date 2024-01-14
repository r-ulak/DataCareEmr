using System;
using System.Threading;
using Abp.Dependency;
using Abp.Logging;
using Castle.Core.Logging;
using EMR.DataAccess.Infrastructure.Database;
using Hangfire.Console;
using Hangfire.Server;
using Microsoft.Azure.Search;
using Microsoft.Azure.Search.Models;

namespace EMR.Manager.Service.Internal
{
    public class AzureIndexManager : IAzureIndexManager, ISingletonDependency
    {
        public ILogger Logger { get; set; }
        private ISearchServiceClient _searchClient;
        private readonly IAzureSearchClientFactory _azureSearchClientFactory;

        private readonly IAppConfigSqlConnection _appConfigSqlConnection;
        public PerformContext Context { get; set; }

        public AzureIndexManager(IAppConfigSqlConnection appConfigSqlConnection, IAzureSearchClientFactory azureSearchClientFactory)
        {
            _appConfigSqlConnection = appConfigSqlConnection;
            _azureSearchClientFactory = azureSearchClientFactory;
        }

        public bool StartIndexingAzureSearch(AzureDataIndexer dataIndexer)
        {
            _searchClient = _azureSearchClientFactory.Create(dataIndexer.Settings.ServiceName,
               dataIndexer.Settings.ApiKey);
            _searchClient.Indexes.GetClient(dataIndexer.IndexName);

            Logger.Log(LogSeverity.Info, "Deleting index, data source, and indexer...");
            Context.WriteLine("Deleting index, data source, and indexer...");

            if (!DeleteIndexingResources(dataIndexer)) return true;
            Logger.Log(LogSeverity.Info, "Creating index...");
            Context.WriteLine("Creating index...");
            CreateIndex(dataIndexer);
            Logger.Log(LogSeverity.Info, "Sync documents from Azure SQL...");
            Context.WriteLine("Sync documents from Azure SQL...");
            SyncDataFromAzureSql(dataIndexer);
            return true;
        }

        private bool DeleteIndexingResources(AzureDataIndexer dataIndexer)
        {
            // Delete the index, data source, and indexer.
            try
            {
                _searchClient.Indexes.Delete(dataIndexer.IndexName);
                _searchClient.DataSources.Delete(dataIndexer.DataSource);
                _searchClient.Indexers.Delete(dataIndexer.Indexer);
            }
            catch (Exception ex)
            {
                Context.SetTextColor(ConsoleTextColor.Red);
                Logger.Log(LogSeverity.Error, $"Error deleting indexing resources: {ex.Message}", ex);
                Context.WriteLine($"Error deleting indexing resources: {ex.Message}");
                Logger.Log(LogSeverity.Info,
                    "Did you remember to add your SearchServiceName and SearchServiceApiKey to the app.config?");
                Context.WriteLine(
                    "Did you remember to add your SearchServiceName and SearchServiceApiKey to the app.config?");
                Context.ResetTextColor();
                return false;
            }

            return true;
        }

        private void CreateIndex(AzureDataIndexer dataIndexer)
        {
            // Create the Azure Search index based on the included schema
            try
            {
                _searchClient.Indexes.Create(dataIndexer.Definition);
            }
            catch (Exception ex)
            {
                Context.SetTextColor(ConsoleTextColor.Red);
                Logger.Log(LogSeverity.Error, $"Error creating index: {ex.Message}", ex);
                Context.WriteLine("Error creating index: {ex.Message}");
                Context.ResetTextColor();
                return;
            }
        }

        private void SyncDataFromAzureSql(AzureDataIndexer dataIndexer)
        {
            // This will use the Azure Search Indexer to synchronize data from Azure SQL to Azure Search
            Logger.Log(LogSeverity.Info, "Creating Data Source...");
            Context.WriteLine("Creating Data Source...");
            var dataSource =
                DataSource.AzureSql(
                    name: dataIndexer.DataSource,
                    sqlConnectionString: _appConfigSqlConnection.GetConnection().ConnectionString,
                    tableOrViewName: dataIndexer.TableName,
                    description: dataIndexer.Description);

            try
            {
                _searchClient.DataSources.Create(dataSource);
            }
            catch (Exception ex)
            {
                Context.SetTextColor(ConsoleTextColor.Red);
                Logger.Log(LogSeverity.Error, $"Error creating data source: {ex.Message}", ex);
                Context.WriteLine($"Error creating data source: {ex.Message}");
                Context.ResetTextColor();
                return;
            }

            Logger.Log(LogSeverity.Info, "Creating Indexer and syncing data...");
            Context.WriteLine("Creating Indexer and syncing data...");

            var indexer =
                new Indexer()
                {
                    Name = dataIndexer.Indexer,
                    Description = dataIndexer.Description,
                    DataSourceName = dataSource.Name,
                    TargetIndexName = dataIndexer.IndexName,
                    Schedule = dataIndexer.Schedule
                };

            try
            {
                _searchClient.Indexers.Create(indexer);
            }
            catch (Exception ex)
            {
                Context.SetTextColor(ConsoleTextColor.Red);
                Logger.Log(LogSeverity.Error, $"Error creating and running indexer: {ex.Message}", ex);
                Context.WriteLine($"Error creating and running indexer: {ex.Message}");
                Context.ResetTextColor();
                return;
            }

            var running = true;
            Logger.Log(LogSeverity.Info, "Synchronization running...");
            Context.WriteLine("Synchronization running...");
            while (running)
            {
                IndexerExecutionInfo status = null;

                try
                {
                    status = _searchClient.Indexers.GetStatus(indexer.Name);
                }
                catch (Exception ex)
                {
                    Context.SetTextColor(ConsoleTextColor.Red);
                    Logger.Log(LogSeverity.Error, $"Error polling for indexer status: {ex.Message}", ex);
                    Context.WriteLine($"Error polling for indexer status: {ex.Message}");
                    Context.ResetTextColor();
                    return;
                }

                var lastResult = status.LastResult;
                if (lastResult == null) continue;
                switch (lastResult.Status)
                {
                    case IndexerExecutionStatus.InProgress:
                        Logger.Log(LogSeverity.Info, "Synchronization running...");
                        Context.WriteLine("Synchronization running...");
                        Thread.Sleep(1000);
                        break;

                    case IndexerExecutionStatus.Success:
                        Context.SetTextColor(ConsoleTextColor.Green);
                        running = false;
                        Logger.Log(LogSeverity.Info, $"Synchronized {lastResult.ItemCount} rows...");
                        Context.WriteLine($"Synchronized {lastResult.ItemCount} rows...");
                        Context.ResetTextColor();
                        break;

                    default:
                        Context.SetTextColor(ConsoleTextColor.Red);
                        running = false;
                        Logger.Log(LogSeverity.Info, $"Synchronization failed: {lastResult.ErrorMessage}");
                        Context.WriteLine($"Synchronization failed: {lastResult.ErrorMessage}");
                        Context.ResetTextColor();
                        throw new InvalidOperationException(lastResult.ErrorMessage);
                }
            }
        }
    }
}
