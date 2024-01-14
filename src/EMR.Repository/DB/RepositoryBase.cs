
    using Castle.Core.Logging; 
    using EMR.DataAccess.Infrastructure.Database;
    
    namespace EMR.Base
    {
        public class RepositoryBase : IRepositoryBase 
        {
            protected readonly IProcExecutor _procExecutor;
            protected ILogger Logger {get; set; }
            public RepositoryBase(IProcExecutor procExecutor)
            {
                _procExecutor = procExecutor;            
            }
        }
      
        public interface IRepositoryBase
        {
        }
    }
