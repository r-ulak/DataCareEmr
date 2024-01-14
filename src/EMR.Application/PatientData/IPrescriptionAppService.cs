using Abp.Application.Services;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Prescription
{
    public interface IPrescriptionAppService : IApplicationService
    {
        Task<long> CreatePrescription(PrescriptionCreateDto input);
        Task<IEnumerable<PrescriptionResultDto>> GetPrescriptionDetail(PatientDataInputDto searchInput);
        Task<IEnumerable<PrescriptionTimeLineResultDto>> GetPrescriptionTimeLine(PatientDataInputDto searchInput);
        Task<List<DrugFormCode>> GetDrugFormCode();
        Task<List<TherapyCode>> GetTherapyCode();
        Task<List<FrequencyCode>> GetFrequencyCode();
        Task<List<DrugRouteCode>> GetDrugRouteCode();
        Task<List<DoseUnitCode>> GetDoseUnitCode();
        Task UpdatePrescription(PrescriptionUpdateDto input);
        Task<List<PrescriptionResultDto>> GetPrescriptionDetailByVisitIdAndPid(PatientVisitDataInputDto input);
    }
}