
update pdg
set pdg.Pid = 7417
from FamilyHistory pdg
Where pdg.Id <20;
;		

update pdg
set pdg.TenantId = pd.TenantId
from FamilyHistory pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;
		

update pdg
set pdg.CreatedBy = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from FamilyHistory pdg;

update pdg
set pdg.UpdatedBy = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from FamilyHistory pdg;

