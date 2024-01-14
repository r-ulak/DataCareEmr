using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Castle.Core.Logging;

namespace EMR.DataAccess.Infrastructure.Database.Implementation
{
    public class AppConfigSqlConnection : IAppConfigSqlConnection
    {
        public ConnectionStringSettings ConnectionString { get; set; }
        public ILogger Logger { get; set; }
        private static string _environmentConnectionString;

        public AppConfigSqlConnection()
            : this(ConfigurationManager.ConnectionStrings[GetConnectionName()])
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
        public AppConfigSqlConnection(ConnectionStringSettings connectionString)
        {
            ConnectionString = connectionString;
            Logger = NullLogger.Instance;
        }

        public virtual IDbConnection GetConnection()
        {
            var connectString = ConnectionString;
            var factory = DbProviderFactories.GetFactory(connectString.ProviderName);
            IDbConnection connection = factory.CreateConnection();

            if (connection == null)
            {
                var csb = new SqlConnectionStringBuilder(ConnectionString.ConnectionString);
                var msg = string.Format("Failed to open a connection to the database '{0}' on '{1}' with user '{2}'",
                    csb.InitialCatalog,
                    csb.DataSource,
                    csb.UserID);

                Logger.Error(msg);

                throw new NullReferenceException(msg);
            }

            connection.ConnectionString = connectString.ConnectionString;
            return connection;
        }

        public void WithCommand(Action<IDbCommand> action)
        {
            WithCommand(cmd =>
            {
                action(cmd);
                return 0; //shut up compiler
            });
        }

        public T WithCommand<T>(Func<IDbCommand, T> action)
        {
            using (var conn = GetConnection())
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    return action(cmd);
                }
            }
        }
    }
}
