		
Update LifeStyle
SET Pid = 7417
Where Pid>395 and PID <400;

	
	Delete from LifeStyle where (Id) NOT IN (
	Select MIN(Id) from LifeStyle
	group by Pid, LifeStyleTypeId
	Having count(*) > 1);
----------------------------------------------------------

update pdg
set pdg.TenantId = pd.TenantId
from LifeStyle pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;
