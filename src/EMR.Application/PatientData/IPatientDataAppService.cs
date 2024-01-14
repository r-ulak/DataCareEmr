using Abp.Application.Services;
using Abp.Application.Services.Dto;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Threading.Tasks;

namespace EMR.PatientData
{
    public interface IPatientDataAppService : IApplicationService
    {
        Task<ListResultDto<PatientSearchResultDto>> GetSearchResult(PatientSearchInputDto searchInput);
        Task<long> Create(PatientDataDto input);
        Task<PatientDataDto> GetPatientData(PatientDataInputDto searchInput);
        Task UpdatePatient(PatientDataDto input);

    }
}