using Abp.Dependency;
using Castle.Core.Logging;
using StackExchange.Redis;
using System;
using System.Configuration;
using System.Net;

namespace EMR.Redis
{
    public class RedisConnectionWrapper : IRedisConnectionWrapper, ISingletonDependency
    {
        public ILogger Logger { get; set; }
        private readonly Lazy<string> _connectionString;
        private readonly string connectionStringName = "redisconnection";
        private readonly string defaultDbKey = "reds.databaseId";
        private readonly string preferSlaveForReadKey = "reds.prefer.slave.for.read";
        private volatile ConnectionMultiplexer _connection;
        private readonly object _lock = new object();

        public RedisConnectionWrapper()
        {
            Logger = NullLogger.Instance;
            _connectionString = new Lazy<string>(GetConnectionString);
        }
        public bool GetPreferSlaveForRead()
        {
            var appsetting = ConfigurationManager.AppSettings[preferSlaveForReadKey];
            bool preferSlaveForRead;
            if (!bool.TryParse(appsetting, out preferSlaveForRead))
            {
                preferSlaveForRead = true;
            }
            return preferSlaveForRead;
        }

        public int GetDefaultDbId()
        {
            var appsetting = ConfigurationManager.AppSettings[defaultDbKey];
            int dbId;
            if (!int.TryParse(appsetting, out dbId))
            {
                dbId = 0;
            }
            return dbId;
        }
        private string GetConnectionString()
        {
            var con = ConfigurationManager.ConnectionStrings[connectionStringName];

            return con == null ? connectionStringName : con.ConnectionString;
        }

        private ConnectionMultiplexer GetConnection()
        {
            if (_connection != null && _connection.IsConnected) return _connection;

            lock (_lock)
            {
                if (_connection != null && _connection.IsConnected) return _connection;

                if (_connection != null)
                {
                    Logger.Debug("Connection disconnected. Disposing connection...");
                    _connection.Dispose();
                }

                Logger.Debug("Creating new instance of Redis Connection");
                _connection = ConnectionMultiplexer.Connect(_connectionString.Value);
            }

            return _connection;
        }

        public IDatabase Database(int? db = null)
        {

            return GetConnection().GetDatabase(db ?? GetDefaultDbId());
        }

        public IServer Server(EndPoint endPoint)
        {
            return GetConnection().GetServer(endPoint);
        }

        public EndPoint[] GetEndpoints()
        {
            return GetConnection().GetEndPoints();
        }

        public void FlushDb(int? db = null)
        {
            var endPoints = GetEndpoints();
            foreach (var endPoint in endPoints)
            {
                Server(endPoint).FlushDatabase(db ?? GetDefaultDbId());
            }
        }

        public void Dispose()
        {
            if (_connection != null)
            {
                _connection.Dispose();
            }
        }
    }
}
