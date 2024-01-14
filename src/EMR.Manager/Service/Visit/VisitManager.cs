
using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for Visit
    /// </summary>
    public class VisitManager : IVisitManager, ISingletonDependency
    {
        private readonly IVisitRepositoryExtended _visitRepositoryExtended;
        private readonly IVisitCodeRepository _visitCodeRepository;
        private readonly IVisitStatusCodeRepository _visitStatusCodeRepository;

        public VisitManager(IVisitRepositoryExtended visitRepositoryExtended, IVisitCodeRepository visitCodeRepository, IVisitStatusCodeRepository visitStatusCodeRepository)
        {
            _visitRepositoryExtended = visitRepositoryExtended;
            _visitCodeRepository = visitCodeRepository;
            _visitStatusCodeRepository = visitStatusCodeRepository;
        }
        public async Task<long> CreateVisitAsync(VisitCreateDto input)
        {
            var  id =  await _visitRepositoryExtended.InsertAsync(input.MapTo<Visit>());
            await _visitRepositoryExtended.UpdateCurrentlyVisited(input);
            return id;
        }

        public async Task UpdateVisitAsync(VisitUpdateDto input)
        {
            await _visitRepositoryExtended.UpdateAsync(input.MapTo<Visit>());
        }

        public async Task<VisitResultDto> GetVisitDetailByPidAsync(PatientDataInputDto input)
        {
            return await _visitRepositoryExtended.GetVisitDetailByPidAsync(input);
        }

        public async Task<List<VisitCode>> GetVisitCodeAsync()
        {
            return await
                 _visitCodeRepository.GetAllAsync();
        }

        public async Task<List<VisitStatusCode>> GetVisitStatusCodeAsync()
        {
            return await
                 _visitStatusCodeRepository.GetAllAsync();
        }

        public async Task<List<VisitResultDto>> GetActiveVisitByLoggedInUserAsync(VisitSearchInputDto input)
        {
            return await
                 _visitRepositoryExtended.GetActiveVisitByLoggedInUserAsync(input);
        }

        public async Task<List<VisitResultDto>> GetVisitHistoryByPidAsync(PatientDataInputDto input)
        {
            return await
                     _visitRepositoryExtended.GetVisitHistoryByPidAsync(input);
        }
    }
}
