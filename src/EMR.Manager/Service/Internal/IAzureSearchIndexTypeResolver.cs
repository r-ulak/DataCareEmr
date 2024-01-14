namespace EMR.Manager.Service.Internal
{
    public interface IAzureSearchIndexTypeResolver
    {
        IAzureSearchIndexType Resolve(string jobName);
        IAzureSearchIndexType ResolveByIndex(string indexName);
    }
}
