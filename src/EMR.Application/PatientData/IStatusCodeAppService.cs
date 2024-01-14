using System.Threading.Tasks;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.Entities;
namespace EMR.StatusCodeSerivce
{
    public interface IStatusCodeAppService : IApplicationService
    {
        Task<List<StatusCode>> GetStatusCode();
    }
}
