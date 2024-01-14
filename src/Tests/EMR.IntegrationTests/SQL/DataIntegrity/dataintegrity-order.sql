

Update OrderSpecimen
SET pid= 7417,
Archived =0
Where  Id  <100

Update OrderResult
SET pid= 7417,
Archived =0
Where  Id  <100


Update ProcedureOrder
SET pid= 7417
Where  Id  <20;


WITH CTE AS 
( 
SELECT TOP 500 * 
FROM OrderCondition 
ORDER BY OrderId 
) 
UPDATE CTE SET OrderId= (ABS(CHECKSUM(NewId())) % 100) + 1;

WITH CTE AS 
( 
SELECT TOP 500 * 
FROM OrderSpecimen 
ORDER BY Id 
) 
UPDATE CTE SET OrderId= (ABS(CHECKSUM(NewId())) % 100) + 1;


WITH CTE AS 
( 
SELECT TOP 500 * 
FROM OrderResult 
ORDER BY Id 
) 
UPDATE CTE SET OrderId= (ABS(CHECKSUM(NewId())) % 100) + 1;

update pdg
set pdg.TenantId = pd.TenantId
from ProcedureOrder pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;

update pdg
set pdg.TenantId = pd.TenantId
from OrderSpecimen pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;

update pdg
set pdg.TenantId = pd.TenantId
from OrderResult pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;
		
		

update pdg
set pdg.ResultById = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from OrderResult pdg;


update pdg
set pdg.OrderdById = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from ProcedureOrder pdg;



update pdg
set pdg.AdministrationSiteId = 
(SELECT TOP 1 AdministrationSiteId FROM AdministrationSite Where TenantId = pdg.TenantId
ORDER BY NEWID())
from OrderSpecimen pdg;


update pdg
set pdg.AdministrationSiteId = 
(SELECT TOP 1 AdministrationSiteId FROM AdministrationSite Where TenantId = pdg.TenantId
ORDER BY NEWID())
from OrderResult pdg;



		
		update pdg
set pdg.CollectedById = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from OrderSpecimen pdg;


		update pdg
set pdg.ResultById = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from OrderResult pdg;

update pdg
set pdg.Pid = pd.Pid,
pdg.TenantId  = pd.TenantId
from OrderResult pdg
    inner join OrderSpecimen pd on
        pdg.OrderId = pd.id;