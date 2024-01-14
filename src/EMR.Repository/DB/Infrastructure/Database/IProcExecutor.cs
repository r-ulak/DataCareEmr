using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EMR.DataAccess.Infrastructure.Database
{
    public interface IProcExecutor
    {
        Task ExecuteAsync(string sproc, object param);
        Task<IEnumerable<TResult>> ExecuteProcAsync<TResult>(string sproc, object param);
        Task<T> ExecuteScalarAsync<T>(string sproc, object param);
        IEnumerable<TResult> ExecuteSql<TResult>(string sql, object param);
        Task<IEnumerable<TResult>> ExecuteSqlAsync<TResult>(string sql, object param);

        IEnumerable<TResult> ExecuteSqlWithMap<TFirst, TSecond, TResult>(string sql,
            Func<TFirst, TSecond, TResult> map, object param, string splitOn = "Id");
    }
}
