Update PatientData
SET tenantId =9
where Pid =7417;


update pdg
set pdg.TenantId = pd.TenantId
from Document pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;
		

		

		
	