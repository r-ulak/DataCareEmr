using Abp.Application.Services.Dto;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Threading.Tasks;

namespace EMR.Manager.Service
{
    public interface IPatientDataManager
    {
        Task<ListResultDto<PatientSearchResultDto>> GetSearchResultAsync(PatientSearchInputDto searchInput);
        Task<long> CreatePatientAsync(PatientDataDto model);
        Task<PatientDataDto> GetPatientDataAsync(PatientDataInputDto searchInput);
        Task UpdatePatientAsync(PatientDataDto model);

    }
}
