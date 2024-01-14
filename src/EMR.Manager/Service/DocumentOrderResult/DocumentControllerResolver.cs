using System;
using System.Collections.Generic;
using System.Linq;
using Abp.Dependency;

namespace EMR.Manager.Service
{
    public class DocumentControllerResolver : IDocumentControllerResolver, ISingletonDependency
    {
        private readonly IEnumerable<IDocumentController> _documentControllers;

        public DocumentControllerResolver(IEnumerable<IDocumentController> documentControllers)
        {
            _documentControllers = documentControllers;
        }

        public IDocumentController Resolve(string referenceTableName)
        {
            var documentType = _documentControllers.FirstOrDefault(item => item.RefrencedTable == referenceTableName);
            if (documentType == null)
            {
                throw new ArgumentException("documentType not found", referenceTableName);
            }
            return documentType;
        }

    }

}


