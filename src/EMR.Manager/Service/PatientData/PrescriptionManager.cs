using System.Collections.Generic;
using Abp.Dependency;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;
using System.Linq;
using System;
using EMR.Entities;
using Abp.AutoMapper;
using EMR.Helper;

namespace EMR.Manager.Service
{
    public class PrescriptionManager : IPrescriptionManager, ISingletonDependency
    {
        private readonly IPrescriptionRepositoryExtended _prescriptionRepositoryExtended;
        private readonly IPrescriptionConditionRepository _prescriptionConditionRepository;
        public PrescriptionManager(IPrescriptionRepositoryExtended prescriptionRepositoryExtended,
            IPrescriptionConditionRepository prescriptionConditionRepository)
        {
            _prescriptionRepositoryExtended = prescriptionRepositoryExtended;
            _prescriptionConditionRepository = prescriptionConditionRepository;
        }

        public async Task UpdatePrescriptionAsync(PrescriptionUpdateDto input)
        {
            var currentRecord = await _prescriptionRepositoryExtended.GetByPrescriptionIdAsync(input.PrescriptionId,
                input.TenantId);
            input.MapTo(currentRecord);
            currentRecord.ParentId = currentRecord.PrescriptionId;
            await _prescriptionRepositoryExtended.ArchiveAndInsertAsync(
                currentRecord);
        }

        public async Task<long> CreatePrescriptionAsync(PrescriptionCreateDto input)
        {
            var id = await _prescriptionRepositoryExtended.InsertAsync(input.MapTo<Prescription>());

            await input.PrimaryCondition
              .ForEachAsync(async item =>
              {
                  await _prescriptionConditionRepository.InsertAsync(PrescriptionCondition.Create(id, item.ICDCodeCNId, true));
              });
            await input.SecondaryCondition
              .ForEachAsync(async item =>
              {
                  await _prescriptionConditionRepository.InsertAsync(PrescriptionCondition.Create(id, item.ICDCodeCNId, false));
              });
            return id;
        }
        public async Task<IEnumerable<PrescriptionResultDto>> GetPrescriptionDetailAsync(PatientDataInputDto input)
        {
            var prescriptionDetailList = await _prescriptionRepositoryExtended.GetPrescriptionDetailByPidAsync(input);
            return
            prescriptionDetailList.GroupBy(l => new
            {
                l.DrugName,
                l.RxNormName,
                l.DoseUnitCodeName,
                l.DoseSize,
                l.Quantity,
                l.StartDate,
                l.EndDate,
                l.FrequencyCodeName,
                l.DrugFormCodeName,
                l.TherapyCodeName,
                l.DrugRouteCodeName,
                l.Dosage,
                l.Refills,
                l.Provider,
                l.Duration,
                l.StatusCodeName,
                l.StatusCodeId,
                l.RefillDate,
                l.PrescriptionId,
                l.Note
            }).Select(g => new PrescriptionResultDto
            {
                DoseSize = g.Key.DoseSize,
                DoseUnitCodeName = g.Key.DoseUnitCodeName,
                Name = g.Key.DrugName,
                RxNormName = g.Key.RxNormName,
                EndDate = g.Key.EndDate,
                FrequencyCodeName = g.Key.FrequencyCodeName,
                Refills = g.Key.Refills,
                DrugFormCodeName = g.Key.DrugFormCodeName,
                TherapyCodeName = g.Key.TherapyCodeName,
                DrugRouteCodeName = g.Key.DrugRouteCodeName,
                Duration = g.Key.Duration,
                Note = g.Key.Note,
                Quantity = g.Key.Quantity,
                Dosage = g.Key.Dosage,
                RefillDate = g.Key.RefillDate,
                StatusCodeName = g.Key.StatusCodeName,
                PrescriptionId = g.Key.PrescriptionId,
                StartDate = g.Key.StartDate,
                StatusCodeId = g.Key.StatusCodeId,
                Provider = g.Key.Provider,
                ConditionName = string.Join(", ", g.Where(o => o.PrimaryCondition).Select(p => p.ConditionName)),
                SecondaryCondition = string.Join(", ", g.Where(o => !o.PrimaryCondition).Select(p => p.ConditionName))
            });
        }

        public async Task<IEnumerable<PrescriptionTimeLineResultDto>> GetPrescriptionTimeLineAsync(PatientDataInputDto input)
        {
            var prescriptionDetailList = await _prescriptionRepositoryExtended.GetPrescriptionTimeLineByPidAsync(input);

            return
            prescriptionDetailList.GroupBy(l => new
            {
                l.RxNormName,
                l.DrugName,
            }).Select(g => new PrescriptionTimeLineResultDto
            {
                Name = g.Key.DrugName,
                RxNormName = g.Key.RxNormName,
                DateRanges = g.Select(x => new PrescriptionTimeLineRange()
                {
                    DoseSize = x.DoseSize,
                    DoseUnitCodeName = x.DoseUnitCodeName,
                    EndDate = x.EndDate,
                    FrequencyCodeName = x.FrequencyCodeName,
                    StartDate = x.StartDate,
                    Strength = (new Random()).Next(1, 24)

                }).OrderBy(x => x.StartDate)
            });
        }

        public async Task<List<PrescriptionResultDto>> GetPrescriptionDetailByVisitIdAndPidAsync(PatientVisitDataInputDto input)
        {
            return await _prescriptionRepositoryExtended.GetPrescriptionDetailByVisitIdAndPidAsync(input);
        }
    }
}
