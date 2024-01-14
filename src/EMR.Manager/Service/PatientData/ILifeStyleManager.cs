using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface ILifeStyleManager
    {
            Task<long> CreateLifeStyleAsync(LifeStyleCreateDto input);
        Task UpdateLifeStyleAsync(LifeStyleUpdateDto input);
        Task<List<LifeStyleResultDto>> GetLifeStyleDetailByPidAsync(PatientDataInputDto input);
        Task<List<LifeStyleType>> GetLifeStyleCodeAsync();
        Task<List<LifeStyleResultDto>> GetLifeStyleDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input);


    }
}
