Update Immunizations
SET Pid = 7417
Where Pid>395 and PID <400;

update pdg
set pdg.TenantId = pd.TenantId
from Immunizations pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;
		
		
		
update pdg
set pdg.AdministeredById = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Immunizations pdg;




update pdg
set pdg.CreatedBy = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Immunizations pdg;

update pdg
set pdg.UpdatedBy = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Immunizations pdg;


update pdg
set pdg.AdministrationSiteId = 
(SELECT TOP 1 AdministrationSiteId FROM AdministrationSite Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Immunizations pdg;


