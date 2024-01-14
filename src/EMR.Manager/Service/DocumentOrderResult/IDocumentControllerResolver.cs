namespace EMR.Manager.Service
{
    public interface IDocumentControllerResolver
    {
        IDocumentController Resolve(string referenceTableName);
    }

}
