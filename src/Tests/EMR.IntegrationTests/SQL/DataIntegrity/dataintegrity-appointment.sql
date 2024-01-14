update pdg
set pdg.TenantId = pd.TenantId
from Appointment pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;

		update pdg
set pdg.StartDate =  dateadd(Hour, pdg.Id, GetDate() ) 
from Appointment pdg
Where Id  in ( Select Top 50 Id from Appointment where TenantId = 9)
;

update pdg
set pdg.CreatedBy = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Appointment pdg;

update pdg
set pdg.UpdatedBy = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Appointment pdg;


update pdg
set pdg.AdministrationSiteId = 
(SELECT TOP 1 AdministrationSiteId FROM AdministrationSite Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Appointment pdg;


UPDATE A
SET A.ProviderId = B.Id
FROM Appointment A
CROSS APPLY (SELECT TOP 1 Id
             FROM abpUsers 
             WHERE A.Id = A.Id
			 AND TenantId = A.TenantId
             ORDER BY NEWID()) B


update pdg
set pdg.EndDate =  dateadd(HOUR, RAND()*(14 - .25)+.25, pdg.StartDate ) 

from Appointment pdg;


update pdg
set pdg.AllDayEvent =  0

from Appointment pdg;


update pdg
set pdg.AllDayEvent =  1
from Appointment pdg
Where 
 DATEDIFF(day,pdg.StartDate,pdg.EndDate) > 8
;

