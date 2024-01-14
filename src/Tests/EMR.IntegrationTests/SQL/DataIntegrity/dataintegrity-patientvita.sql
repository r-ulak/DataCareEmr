update pdg
set pdg.TenantId = pd.TenantId
from PatientVital pdg
    inner join PatientData pd on
        pdg.pid = pd.pid