using System.Threading.Tasks;
using EMR.DTO;
using Abp.Application.Services;

namespace EMR.ICDCodeCN
{
    public interface IICDCodeCNAppService : IApplicationService
    {
        Task CreateICDCodeCN(ICDCodeCNCreateUpdateDto input);
    }
}
