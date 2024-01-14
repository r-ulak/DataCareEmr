Update Prescription
SET pid= 7417
Where  PrescriptionId  <100

Update Prescription
SET pid= 7417
Where  PrescriptionId  <100



Update Prescription
SET EndDate= DATEADD(day, (ABS(CHECKSUM(NEWID())) % 365), StartDate)
Where  pid = 7417;	


WITH CTE AS 
( 
SELECT TOP 500 * 
FROM PrescriptionCondition 
ORDER BY PrescriptionId 
) 
UPDATE CTE SET PrescriptionId= (ABS(CHECKSUM(NewId())) % 100) + 1;

update pdg
set pdg.TenantId = pd.TenantId
from Prescription pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;
		
update pdg
set pdg.ProviderId = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Prescription pdg;
