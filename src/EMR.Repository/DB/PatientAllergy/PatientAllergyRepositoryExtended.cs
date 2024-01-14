using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Dependency;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DTO;
using EMR.DTO.PatientSearch.Dto;

namespace EMR.DAL
{
    public class PatientAllergyRepositoryExtended : PatientAllergyRepository, IPatientAllergyRepositoryExtended, ISingletonDependency
    {
        public PatientAllergyRepositoryExtended(IProcExecutor procExecutor) : base(procExecutor)
        {
        }

        public async Task<List<PatientAllergyResultDto>> GetPatientAllergyByPidAsync(PatientDataInputDto input)
        {
            var result = (await _procExecutor.ExecuteProcAsync<PatientAllergyResultDto>("GetAllergyDetailByPid", new
            {
                Pid = input.PatientId,
                TenantId = input.TenantId
            })) ?? new List<PatientAllergyResultDto>();
            return result.ToList();
        }

    }
}
