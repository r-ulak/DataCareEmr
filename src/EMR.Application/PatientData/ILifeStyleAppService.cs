using System.Threading.Tasks;
using EMR.DTO;
using System.Collections.Generic;
using Abp.Application.Services;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.LifeStyle
{
    public interface ILifeStyleAppService : IApplicationService
    {
        Task<long> CreateLifeStyle(LifeStyleCreateDto input);
        Task UpdateLifeStyle(LifeStyleUpdateDto input);
        Task<List<LifeStyleResultDto>> GetLifeStyleDetailByPid(PatientDataInputDto input);
        Task<List<LifeStyleType>> GetLifeStyleCode();
        Task<List<LifeStyleResultDto>> GetLifeStyleDetailByVisitIdAndPid(PatientVisitDataInputDto input);

    }
}
