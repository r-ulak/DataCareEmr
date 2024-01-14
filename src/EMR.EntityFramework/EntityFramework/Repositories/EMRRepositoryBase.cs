using Abp.Domain.Entities;
using Abp.EntityFramework;
using Abp.EntityFramework.Repositories;

namespace EMR.EntityFramework.Repositories
{
    public abstract class EMRRepositoryBase<TEntity, TPrimaryKey> : EfRepositoryBase<EMRDbContext, TEntity, TPrimaryKey>
        where TEntity : class, IEntity<TPrimaryKey>
    {
        protected EMRRepositoryBase(IDbContextProvider<EMRDbContext> dbContextProvider)
            : base(dbContextProvider)
        {

        }

        //add common methods for all repositories
    }

    public abstract class EMRRepositoryBase<TEntity> : EMRRepositoryBase<TEntity, int>
        where TEntity : class, IEntity<int>
    {
        protected EMRRepositoryBase(IDbContextProvider<EMRDbContext> dbContextProvider)
            : base(dbContextProvider)
        {

        }

        //do not add any method here, add to the class above (since this inherits it)
    }
}
