using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;

namespace EMR.DAL
{
    /// <summary>
    /// Repository methods for DocumentOrderResult
    /// </summary>
    public class DocumentOrderResultRepositoryExtended : DocumentOrderResultRepository, IDocumentOrderResultRepositoryExtended
    {
        public DocumentOrderResultRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

    }
}
