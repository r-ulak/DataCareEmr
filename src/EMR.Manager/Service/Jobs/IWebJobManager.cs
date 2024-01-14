using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface IWebJobManager
    {
        Task<List<WebJob>> GetAllWebJobsAsync();
    }
}
