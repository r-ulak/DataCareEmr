

using Abp.Dependency;
using System.Collections.Generic;
using System.Linq;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;
using EMR.Helper;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for PatientReviewOfSystem
    /// </summary>
    public class PatientReviewOfSystemManager : IPatientReviewOfSystemManager, ISingletonDependency
    {
        private readonly IPatientReviewOfSystemRepositoryExtended _patientreviewofsystemRepositoryExtended;

        public PatientReviewOfSystemManager(
            IPatientReviewOfSystemRepositoryExtended patientreviewofsystemRepositoryExtended)
        {
            _patientreviewofsystemRepositoryExtended = patientreviewofsystemRepositoryExtended;
        }

        public async Task CreatePatientReviewOfSystemAsync(CreatePatientReviewOfSystemDto reviewOfSystem)
        {
            var input = reviewOfSystem.ReviewOfSystem;
            var visitDto = new PatientReviewOfSystemnputDto()
            {
                TenantId = input.First().TenantId,
                PatientId = input.First().Pid,
                VisitId = input.First().VisitId,
                IsShortCode = reviewOfSystem.IsShortCode,
            };
            await
                _patientreviewofsystemRepositoryExtended
                    .DeletePatientReviewOfSystemDetailByVisitIdAndPidAsync(visitDto);

            await input.ForEachAsync(async x =>
                {
                    await _patientreviewofsystemRepositoryExtended
                        .InsertAsync(x.MapTo<PatientReviewOfSystem>());
                }
            );
        }

        public async Task<List<PatientReviewOfSystemResultDto>> GetPatientReviewOfSystemDetailByPidAsync(
            PatientDataInputDto input)
        {
            return await _patientreviewofsystemRepositoryExtended.GetPatientReviewOfSystemDetailByPidAsync(input);
        }

        public async Task<List<ReviewOfSystemGroupedCodeResultDto>> GetPatientReviewOfSystemDetailByVisitIdAndPidAsync(
            PatientReviewOfSystemnputDto input)
        {
            var result =
                await _patientreviewofsystemRepositoryExtended.GetPatientReviewOfSystemDetailByVisitIdAndPidAsync(input);

            return
                result.
                    GroupBy(x => new {x.ReviewOfSystemGroupCodeName, x.SortOrder},
                        (key, group) =>
                        {
                            var reviewOfSystemCodeResultDtos = @group as IList<ReviewOfSystemCodeResultDto> ?? @group.ToList();
                            return new ReviewOfSystemGroupedCodeResultDto()
                            {
                                ReviewOfSystemGroupCodeName = key.ReviewOfSystemGroupCodeName,
                                SortOrder = key.SortOrder,
                                ReviewOfSystemCode = reviewOfSystemCodeResultDtos,
                                IsShort = reviewOfSystemCodeResultDtos.Count(x => x.IsShortCode) > 0,
                                IsComprehensive = reviewOfSystemCodeResultDtos.Count(x => !x.IsShortCode) > 0
                            };
                        }).OrderBy(x => x.SortOrder)
                    .ToList();
        }
    }
}
