Update PatientData
Set CurrentlyInVisit = 0;
Delete From Visit;
SET IDENTITY_INSERT dbo.Visit ON;  

INSERT INTO Visit
  (Id, Pid,   TenantId,   VisitStatusCodeId,   VisitCodeId,    AdministrationSiteId,	 doctorId,
	  nurseId,	 reason,	  createDate,	  updateDate,	   createdBy, updatedBy )
SELECT Distinct p1.VisitId, p1.Pid, 1, FLOOR(RAND()*(6-1)+1) as visitStatus,  FLOOR(RAND()*(4-1)+1) as visitCode,
0 as siteId, 1 as doctorId, 1 as nurserId, 'Reason' as reason, GetDate() createDate, GetDate() updateDate,
1 as createdBy, 1 as updatedBy from 

 (SELECT VisitId, Max(Pid) Pid
  FROM ProcedureOrder t1
 WHERE NOT EXISTS(SELECT Id
                    FROM Visit t2
                   WHERE t2.Id = t1.VisitId)
				   Group By VisitId
				   ) as p1 ;

INSERT INTO Visit
  (Id, Pid,   TenantId,   VisitStatusCodeId,   VisitCodeId,    AdministrationSiteId,	 doctorId,
	  nurseId,	 reason,	  createDate,	  updateDate,	   createdBy, updatedBy )
SELECT Distinct p1.VisitId, p1.Pid, 1, FLOOR(RAND()*(6-1)+1) as visitStatus,  FLOOR(RAND()*(4-1)+1) as visitCode,
0 as siteId, 1 as doctorId, 1 as nurserId, 'Reason' as reason, GetDate() createDate, GetDate() updateDate,
1 as createdBy, 1 as updatedBy from 

 (SELECT VisitId, Max(Pid) Pid
  FROM Surgery t1
 WHERE NOT EXISTS(SELECT Id
                    FROM Visit t2
                   WHERE t2.Id = t1.VisitId)
				   Group By VisitId
				   ) as p1 ;
INSERT INTO Visit
  (Id, Pid,   TenantId,   VisitStatusCodeId,   VisitCodeId,    AdministrationSiteId,	 doctorId,
	  nurseId,	 reason,	  createDate,	  updateDate,	   createdBy, updatedBy )
SELECT Distinct p1.VisitId, p1.Pid, 1, FLOOR(RAND()*(6-1)+1) as visitStatus,  FLOOR(RAND()*(4-1)+1) as visitCode,
0 as siteId, 1 as doctorId, 1 as nurserId, 'Reason' as reason, GetDate() createDate, GetDate() updateDate,
1 as createdBy, 1 as updatedBy from 

 (SELECT VisitId, Max(Pid) Pid
  FROM Diagnosis t1
 WHERE NOT EXISTS(SELECT Id
                    FROM Visit t2
                   WHERE t2.Id = t1.VisitId)
				   Group By VisitId
				   ) as p1 ;
				   
INSERT INTO Visit
  (Id, Pid,   TenantId,   VisitStatusCodeId,   VisitCodeId,    AdministrationSiteId,	 doctorId,
	  nurseId,	 reason,	  createDate,	  updateDate,	   createdBy, updatedBy )
SELECT Distinct p1.VisitId, p1.Pid, 1, FLOOR(RAND()*(6-1)+1) as visitStatus,  FLOOR(RAND()*(4-1)+1) as visitCode,
0 as siteId, 1 as doctorId, 1 as nurserId, 'Reason' as reason, GetDate() createDate, GetDate() updateDate,
1 as createdBy, 1 as updatedBy from 

 (SELECT VisitId, Max(Pid) Pid
  FROM Prescription t1
 WHERE NOT EXISTS(SELECT Id
                    FROM Visit t2
                   WHERE t2.Id = t1.VisitId)
				   Group By VisitId
				   ) as p1 ;
INSERT INTO Visit
  (Id, Pid,   TenantId,   VisitStatusCodeId,   VisitCodeId,    AdministrationSiteId,	 doctorId,
	  nurseId,	 reason,	  createDate,	  updateDate,	   createdBy, updatedBy )
SELECT Distinct p1.VisitId, p1.Pid, 1, FLOOR(RAND()*(6-1)+1) as visitStatus,  FLOOR(RAND()*(4-1)+1) as visitCode,
0 as siteId, 1 as doctorId, 1 as nurserId, 'Reason' as reason, GetDate() createDate, GetDate() updateDate,
1 as createdBy, 1 as updatedBy from 

 (SELECT VisitId, Max(Pid) Pid
  FROM LifeStyle t1
 WHERE NOT EXISTS(SELECT Id
                    FROM Visit t2
                   WHERE t2.Id = t1.VisitId)
				   Group By VisitId
				   ) as p1 ;				   
update pdg
set pdg.TenantId = pd.TenantId
from Visit pdg
    inner join PatientData pd on
        pdg.pid = pd.pid;				    
update pdg
set pdg.DoctorId = 
(SELECT TOP 1 Id FROM abpUsers Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Visit pdg;

update pdg
set pdg.AdministrationSiteId = 
(SELECT TOP 1 AdministrationSiteId FROM AdministrationSite Where TenantId = pdg.TenantId
ORDER BY NEWID())
from Visit pdg;
		   
SET IDENTITY_INSERT dbo.Visit OFF;  


Update pd
Set pd.CurrentlyInVisit = 1
from PatientData pd 
INNER JOIN VISIT V ON V.PID = PD.PID
WHERE V.VisitStatusCodeId <6;


