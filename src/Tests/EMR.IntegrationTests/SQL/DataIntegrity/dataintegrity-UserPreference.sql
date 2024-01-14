

INSERT INTO UserPreference
SELECT Id, TenantId, 1, '#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2), 
GetDate(),
 GetDate(),
 0,0 FROM AbpUsers
 Where TenantId is not null
 
 update pdg
set pdg.AdministrationSiteId = 
(SELECT TOP 1 AdministrationSiteId FROM AdministrationSite Where TenantId = pdg.TenantId
ORDER BY NEWID())
from UserPreference pdg;
