using System.Threading.Tasks;
using EMR.DTO;
using Abp.Application.Services;

namespace EMR.ICDCodePCS
{
    public interface IICDCodePCSAppService : IApplicationService
    {
        Task CreateICDCodePCS(ICDCodePCSCreateUpdateDto input);
    }
}
