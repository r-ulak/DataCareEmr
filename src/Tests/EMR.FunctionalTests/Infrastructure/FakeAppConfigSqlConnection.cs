using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Castle.Core.Logging;
using Emr.TestsCommon;
using EMR.FunctionalTests.Infrastructure;

namespace EMR.DataAccess.Infrastructure.Database.Implementation
{
    public class FakeAppConfigSqlConnection : IAppConfigSqlConnection
    {
        public ILogger Logger { get; set; }
        private static string _environmentConnectionString;

        public FakeAppConfigSqlConnection()
            : this(ConfigurationManager.ConnectionStrings[GetConnectionName()])
        {
        }

        private static string GetConnectionName()
        {
           return SqlExpressDbController.GetLocalDbConnection(SqlExpressDbController.DbName).ConnectionString;
        }
        public FakeAppConfigSqlConnection(ConnectionStringSettings connectionString)
        {
            Logger = NullLogger.Instance;
        }

        public virtual IDbConnection GetConnection()
        {
            IDbConnection connection = SqlExpressDbController.GetLocalDbConnection(SqlExpressDbController.DbName);

            if (connection == null)
            {
                var csb = new SqlConnectionStringBuilder(connection.ConnectionString);
                var msg = string.Format("Failed to open a connection to the database '{0}' on '{1}' with user '{2}'",
                    csb.InitialCatalog,
                    csb.DataSource,
                    csb.UserID);

                Logger.Error(msg);

                throw new NullReferenceException(msg);
            }

            connection.ConnectionString = connection.ConnectionString;
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
