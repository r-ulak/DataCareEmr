using StackExchange.Redis;
using System;
using System.Net;
using System.Threading.Tasks;

namespace EMR.Redis
{
    public interface IRedisConnectionWrapper : IDisposable
    {
        IDatabase Database(int? db = null);
        IServer Server(EndPoint endPoint);
        EndPoint[] GetEndpoints();
        void FlushDb(int? db = null);
        int GetDefaultDbId();
        bool GetPreferSlaveForRead();

    }
}
