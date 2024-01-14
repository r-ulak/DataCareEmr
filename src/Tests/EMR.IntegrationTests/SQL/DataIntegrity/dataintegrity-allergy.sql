update pdg
set pdg.TenantId = pd.TenantId
from PatientAllergy pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;