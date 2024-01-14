using Abp.Dependency;
using StackExchange.Redis;
using System;
using System.Threading.Tasks;
using Castle.Core.Logging;

namespace EMR.Redis
{
    public class RedisCacheStore : IRedisCacheStore, ITransientDependency
    {
        private readonly IDatabase _database;
        private readonly ISerializer _serializer;
        private readonly CommandFlags _readFlag;
        public ILogger Logger { get; set; }

        public RedisCacheStore(IRedisConnectionWrapper connectionWrapper, ISerializer serializer)
        {
            _database = connectionWrapper.Database(connectionWrapper.GetDefaultDbId());
            _serializer = serializer;
            _readFlag = connectionWrapper.GetPreferSlaveForRead() ? CommandFlags.PreferSlave : CommandFlags.PreferMaster;
        }

        async Task<bool> IRedisCacheStore.ExistsAsync(string key)
        {
            try
            {
                return await _database.KeyExistsAsync(key);
            }
            catch (Exception exception)
            {
                Logger.Error("ExistsAsync", exception);
                return false;
            }
        }

        async Task<T> IRedisCacheStore.GetAsync<T>(string key)
        {
            try
            {
                var result = await _database.StringGetAsync(key, _readFlag);
                return !result.HasValue ? default(T) : _serializer.Deserialize<T>(result);
            }
            catch (Exception exception)
            {
                Logger.Error("GetAsync", exception);
                return default(T);
            }
        }

        async Task IRedisCacheStore.SetAsync<T>(string key, T value, TimeSpan expiredIn)
        {
            try
            {
                await _database.StringSetAsync(key, _serializer.Serialize(value), expiredIn);
            }
            catch (Exception exception)
            {
                Logger.Error("SetAsync", exception);
            }
        }

        async Task IRedisCacheStore.RemoveAsync(string key)
        {
            await _database.KeyDeleteAsync(key);
        }

        bool IRedisCacheStore.Exists(string key)
        {
            try
            {
                return _database.KeyExists(key, _readFlag);
            }
            catch (Exception exception)
            {
                Logger.Error("Exists", exception);
                return false;
            }
        }

        T IRedisCacheStore.Get<T>(string key)
        {
            try
            {
                return _serializer.Deserialize<T>(_database.StringGet(key, CommandFlags.PreferSlave));
            }
            catch (Exception exception)
            {
                Logger.Error("Get", exception);
                return default(T);
            }
        }

        void IRedisCacheStore.Set<T>(string key, T value, TimeSpan expiredIn)
        {
            try
            {
                _database.StringSet(key, _serializer.Serialize(value), expiredIn);
            }
            catch (Exception exception)
            {
                Logger.Error("Set", exception);
            }
        }

        void IRedisCacheStore.Remove(string key)
        {
            _database.KeyDelete(key);
        }
    }
}
