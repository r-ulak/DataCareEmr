using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using Abp.Dependency;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using EMR.Entities;
using EMR.Repository.DB.PatientData;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
namespace EMR.Manager.Service
{
    public class PatientDataManager : IPatientDataManager, ISingletonDependency
    {
        private readonly IPatientDataRepositoryExtended _patientRepositoryExtended;
        public PatientDataManager(IPatientDataRepositoryExtended patientRepositoryExtended)
        {
            _patientRepositoryExtended = patientRepositoryExtended;
        }
        public async Task<ListResultDto<PatientSearchResultDto>> GetSearchResultAsync(PatientSearchInputDto searchInput)
        {
            if (string.IsNullOrEmpty(searchInput.QueryTerm) || string.IsNullOrWhiteSpace(searchInput.QueryTerm))
            {
                return new ListResultDto<PatientSearchResultDto>();
            }
            Int64 pid = 0;
            if (Int64.TryParse(searchInput.QueryTerm, out pid))
            {
                var searchResult = await _patientRepositoryExtended.GetByPidAsync(pid, searchInput.TenantId);

                var patientRow = searchResult.MapTo<PatientSearchResultDto>();
                if (patientRow == null) return new ListResultDto<PatientSearchResultDto>();
                var resultList =
                    new List<PatientSearchResultDto>() { patientRow };
                return new ListResultDto<PatientSearchResultDto>(
                       resultList.MapTo<List<PatientSearchResultDto>>());
            }
            return new ListResultDto<PatientSearchResultDto>(
                await _patientRepositoryExtended.GetPatientSearchByNameAsync(searchInput));
        }

        public async Task<PatientDataDto> GetPatientDataAsync(PatientDataInputDto searchInput)
        {
            var pateintData = await _patientRepositoryExtended.GetByPidAsync(searchInput.PatientId, searchInput.TenantId);
            return pateintData.MapTo<PatientDataDto>();
        }

        public async Task<long> CreatePatientAsync(PatientDataDto model)
        {
            return await _patientRepositoryExtended.InsertAsync(model.MapTo<PatientData>());
        }

        public async Task UpdatePatientAsync(PatientDataDto model)
        {
            await _patientRepositoryExtended.UpdateAsync(model.MapTo<PatientData>());
        }
    }
}
