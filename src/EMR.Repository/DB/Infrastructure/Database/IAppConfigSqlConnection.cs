using Abp.Dependency;
using System;
using System.Data;

namespace EMR.DataAccess.Infrastructure.Database
{
	public interface IAppConfigSqlConnection: ITransientDependency
    {
		IDbConnection GetConnection();
	    void WithCommand(Action<IDbCommand> action);
	    T WithCommand<T>(Func<IDbCommand, T> action);
	}
}