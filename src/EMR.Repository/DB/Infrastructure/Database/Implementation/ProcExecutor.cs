using System;
using System.Collections.Generic;
using System.Data;
using Dapper;
using Castle.Core.Logging;
using Newtonsoft.Json;
using System.Threading.Tasks;
using Abp.Dependency;

namespace EMR.DataAccess.Infrastructure.Database.Implementation
{
    public class ProcExecutor : IProcExecutor, ISingletonDependency
    {
        private readonly IAppConfigSqlConnection _connection;
        public ILogger Logger { get; set; }

        public ProcExecutor(IAppConfigSqlConnection connection)
        {
            _connection = connection;
            Logger = NullLogger.Instance;
        }

        public async Task<T> ExecuteScalarAsync<T>(string sproc, object param)
        {
            try
            {
                using (var conn = _connection.GetConnection())
                {
                   return await conn.ExecuteScalarAsync<T>(sproc, param, commandType: CommandType.StoredProcedure);
                }

            }
            catch (Exception ex)
            {
                var errInfo = JsonConvert.SerializeObject(new
                {
                    ErrorId = (int)ErrorCodes.SqlError,
                    StoredProcedure = sproc,
                    Parameters = param
                });

                Logger.Error($"Stored Procedure Error: {errInfo}", ex);
                throw;
            }
        }
        public async Task ExecuteAsync(string sproc, object param)
        {
            try
            {
                using (var conn = _connection.GetConnection())
                {
                    await conn.ExecuteAsync(sproc, param, commandType: CommandType.StoredProcedure);
                }

            }
            catch (Exception ex)
            {
                var errInfo = JsonConvert.SerializeObject(new
                {
                    ErrorId = (int)ErrorCodes.SqlError,
                    StoredProcedure = sproc,
                    Parameters = param
                });

                Logger.Error($"Stored Procedure Error: {errInfo}", ex);
                throw;
            }
        }

        public async Task<IEnumerable<TResult>> ExecuteProcAsync<TResult>(string sproc, object param)
        {
            try
            {
                using (var conn = _connection.GetConnection())
                {
                    return await conn.QueryAsync<TResult>(sproc, param, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                var errInfo = JsonConvert.SerializeObject(new
                {
                    ErrorId = (int)ErrorCodes.SqlError,
                    StoredProcedure = sproc,
                    Parameters = param
                });

                Logger.Error($"Stored Procedure Error: {errInfo}", ex);
                throw;
            }
        }
        public IEnumerable<TResult> ExecuteSql<TResult>(string sql, object param)
        {
            try
            {
                using (var conn = _connection.GetConnection())
                {
                    return conn.Query<TResult>(sql, param);
                }
            }
            catch (Exception ex)
            {
                var errInfo = JsonConvert.SerializeObject(new
                {
                    ErrorId = (int)ErrorCodes.SqlError,
                    Sql = sql,
                    Parameters = param
                });

                Logger.Error($"sql  Error: {errInfo}", ex);
                throw;
            }
        }

        public async Task<IEnumerable<TResult>> ExecuteSqlAsync<TResult>(string sql, object param)
        {
            try
            {
                using (var conn = _connection.GetConnection())
                {
                    return await conn.QueryAsync<TResult>(sql, param);
                }
            }
            catch (Exception ex)
            {
                var errInfo = JsonConvert.SerializeObject(new
                {
                    ErrorId = (int)ErrorCodes.SqlError,
                    Sql = sql,
                    Parameters = param
                });

                Logger.Error($"sql  Error: {errInfo}", ex);
                throw;
            }
        }
        public IEnumerable<TResult> ExecuteSqlWithMap<TFirst, TSecond, TResult>(string sql, Func<TFirst, TSecond, TResult> map, object param, string splitOn = "Id")
        {
            try
            {
                using (var conn = _connection.GetConnection())
                {
                    return conn.Query<TFirst, TSecond, TResult>(sql, map, param, splitOn: splitOn);
                }
            }
            catch (Exception ex)
            {
                var errInfo = JsonConvert.SerializeObject(new
                {
                    ErrorId = (int)ErrorCodes.SqlError,
                    Sql = sql,
                    Parameters = param
                });

                Logger.Error($"sql  Error: {errInfo}", ex);
                throw;
            }
        }
    }
}
