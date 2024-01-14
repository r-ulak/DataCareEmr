IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPatientSearchByName') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPatientSearchByName
GO
-- ==========================================================================================
-- Entity Name:	GetPatientSearchByName
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for searching by Name from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPatientSearchByName
	(
		@TenantId int,
		@QueryTerm nvarchar(50),
		@SkipCount int,
		@PageSize int
	)
AS
	SET NOCOUNT ON

	SELECT 
	[Pid],
	[Fname],
	[Lname],
	[Mname],
	[DOB],
	[CurrentlyInVisit],
	[Gender]
	FROM PatientData pd
	WHERE 
	pd.TenantId = @TenantId 
	AND (
	CONCAT(pd.Fname , ' ' , pd.Lname) LIKE @QueryTerm + '%'
	OR  pd.Fname LIKE @QueryTerm + '%' OR  pd.Fname LIKE  '%' + @QueryTerm
	OR  pd.Lname LIKE @QueryTerm + '%' OR pd.Lname LIKE  '%' + @QueryTerm )
	ORDER BY Pid
	OFFSET @SkipCount ROWS
	FETCH NEXT @PageSize ROWS ONLY
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPatientDiagnosisByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPatientDiagnosisByPid
GO
-- ==========================================================================================
-- Entity Name:	GetPatientDiagnosisByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for searching by Name from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPatientDiagnosisByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	dc.DiagnosisName,
	pd.DiagnosisCode,
	pd.DateCreated as DateIdentified	
	FROM PatientDiagnosis pd
	INNER JOIN DiagnosisCode dc on dc.DiagnosisCodeId = pd.DiagnosisCode
	WHERE 
	pd.TenantId = @TenantId 
	AND pd.pid = @Pid
	AND pd.Archived = 0
	ORDER BY pd.DateCreated desc
GO
;


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPrescriptionDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPrescriptionDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetPrescriptionDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Prescription detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPrescriptionDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	pc.PrimaryCondition,
	dc.Name,
	p.*,
	duc.DoseUnitCodeName,
	dfc.DrugFormCodeName,
	ic.ICDCodeCNShortName as ConditionName,
	u.UserName as Provider,
	tc.TherapyCodeName,
	drc.DrugRouteCodeName,
	sc.*,
	fc.FrequencyCodeName
	FROM Prescription p
	LEFT JOIN AbpUsers u on p.ProviderId = u.Id and u.TenantId = @TenantId 	
	LEFT JOIN DrugCode dc on dc.Id = p.DrugId AND p.RxNormName is NULL
	LEFT JOIN PrescriptionCondition pc on pc.PrescriptionId = p.PrescriptionId
	LEFT JOIN ICDCodeCN ic on ic.ICDCodeCNId = pc.ICDCodeCNId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)	
	LEFT JOIN TherapyCode tc on tc.TherapyCodeId = p.TherapyCodeId
	LEFT JOIN FrequencyCode fc on fc.FrequencyCodeId = p.FrequencyCodeId
	LEFT JOIN DoseUnitCode duc on duc.DoseUnitCodeId = p.DoseUnitCodeId
	LEFT JOIN DrugFormCode dfc on dfc.DrugFormCodeId = p.DrugFormCodeId
	LEFT JOIN DrugRouteCode drc on drc.DrugRouteCodeId = p.DrugRouteCodeId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = p.StatusCodeId

	WHERE 
	p.TenantId = @TenantId 
	AND p.pid = @Pid
	AND p.Archived = 0
	ORDER BY p.StartDate desc
GO
;


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPrescriptionTimeLineByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPrescriptionTimeLineByPid
GO
-- ==========================================================================================
-- Entity Name:	GetPrescriptionTimeLineByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Prescription timeline that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPrescriptionTimeLineByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 	
	dc.Name,	
	p.*,
	fc.*
	FROM Prescription p
	LEFT JOIN DrugCode dc on dc.Id = p.DrugId AND p.RxNormName is NULL
	LEFT JOIN FrequencyCode fc on fc.FrequencyCodeId = p.FrequencyCodeId

	WHERE 
	p.TenantId = @TenantId 
	AND p.pid = @Pid
	AND p.Archived = 0
	ORDER BY p.StartDate desc
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetAllergyDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetAllergyDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetAllergyDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Allergy detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetAllergyDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	p.PatientAllergyId,	
	p.ReactionName,
	atc.AllergyTypeName,
	atc.Priority,	
	ase.AllergySeverityCodeName,
	acc.CategoryName,
	p.AllergyName,
	p.StartDate,
	p.EndDate,
	p.Note,
	p.Status,	
	p.Provider
	FROM PatientAllergy p	
	INNER JOIN AllergyCategoryCode acc on acc.AllergyCategoryCodeId = p.AllergyCategoryCodeId
	INNER JOIN AllergySeverityCode ase on ase.AllergySeverityCodeId = p.SeverityId
	INNER JOIN AllergyTypeCode atc on atc.AllergyTypeId = p.AllergyTypeId	
	WHERE 
	p.TenantId = @TenantId 
	AND p.pid = @Pid
	AND p.Archived = 0
	ORDER BY p.Status, atc.Priority 
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetRolesByPermission') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetRolesByPermission
GO
-- ==========================================================================================
-- Entity Name:	GetRolesByPermission
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing GetRolesByPermission -- ==========================================================================================
CREATE PROCEDURE [dbo].GetRolesByPermission
	(
		@TenantId int,
		@FilteredPermissionName nvarchar(128)
	)
AS
	SET NOCOUNT ON

	SELECT 
	r.*
	FROM AbpRoles r
	INNER JOIN AbpPermissions p on p.RoleId = r.Id
	WHERE 
	p.TenantId = @TenantId 
	And p.IsGranted = 1
	AND p.Name = @FilteredPermissionName
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DeleteAbpUserRole') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DeleteAbpUserRole
GO
-- ==========================================================================================
-- Entity Name:	DeleteAbpUserRole
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for soft deleting Allergy
-- ==========================================================================================
CREATE PROCEDURE [dbo].DeleteAbpUserRole
	(
		@AbpUserRoleId bigint,
		@TenantId int
	)
AS
	DELETE FROM AbpUserRoles 
	WHERE TenantId = @TenantId 
	AND Id = @AbpUserRoleId
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetUserByRole') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetUserByRole
GO
-- ==========================================================================================
-- Entity Name:	GetUserByRole
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing GetUserByRole -- ==========================================================================================
CREATE PROCEDURE [dbo].GetUserByRole
	(
		@TenantId int,
		@FilteredRoleId int
	)
AS
	SET NOCOUNT ON

	SELECT 
	u.*
	FROM AbpUsers u
	INNER JOIN AbpUserRoles r on r.UserId = u.Id
	WHERE 
	u.TenantId = @TenantId 
	And u.IsDeleted = 0
	AND r.RoleId = @FilteredRoleId
GO
;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetRoleByUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetRoleByUserId
GO
-- ==========================================================================================
-- Entity Name:	GetRoleByUserId
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing GetRoleByUserId -- ==========================================================================================
CREATE PROCEDURE [dbo].GetRoleByUserId
	(
		@TenantId int,
		@UserId int
	)
AS
	SET NOCOUNT ON

	SELECT 
	r.*
	FROM AbpRoles r
	INNER JOIN AbpUserRoles ur on ur.RoleId = r.Id
	WHERE 
	ur.TenantId = @TenantId 
	AND ur.UserId = @UserId
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetAuditLogsByFilter') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetAuditLogsByFilter
GO
-- ==========================================================================================
-- Entity Name:	GetAuditLogsByFilter
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing GetAuditLogsByFilter -- ==========================================================================================
CREATE PROCEDURE [dbo].GetAuditLogsByFilter
	(
		@StartDate datetime =null,
		@EndDate date = null,
		@DateFilter bit,
		@UserId bigint,
		@UserIdFilter bit,
		@ServiceName nvarchar(256),
		@ServiceNameFilter bit,
		@ExecutionDurationMin int, 
		@ExecutionDurationMax int, 
		@ExecutionDurationFilter bit,
		@MethodName nvarchar(256),
		@MethodNameFilter bit,
		@ErrorState bit,
		@ErrorStateFilter bit,
		@BrowserInfo nvarchar(256),
		@BrowserInfoFilter bit,
		@TenantId int,
		@Offset int,
		@MaxLimit int
	)
AS
	SET NOCOUNT ON

	SELECT 
	a.*, u.UserName
	FROM [AbpAuditLogs] a
	INNER JOIN AbpUsers u on a.UserId = u.Id and u.TenantId = @TenantId 
	WHERE 
	a.TenantId = @TenantId 
	AND ( @DateFilter = 0 OR ( a.ExecutionTime>= @StartDate AND a.ExecutionTime<=@EndDate ))
	AND ( @UserIdFilter = 0 OR a.UserId = @UserId )
	AND ( @ServiceNameFilter = 0 OR a.ServiceName = @ServiceName )
	AND ( @ExecutionDurationFilter = 0 OR( a.ExecutionDuration>= @ExecutionDurationMin AND a.ExecutionDuration<= @ExecutionDurationMax))
	AND ( @MethodNameFilter = 0 OR a.MethodName = @MethodName )	
	AND ( @BrowserInfoFilter = 0 OR a.BrowserInfo = @BrowserInfo )	
	AND (@ErrorStateFilter = 0 
		OR
		(@ErrorState = 1 AND  a.Exception is NOT NULL )
		OR
		(@ErrorState = 0 AND  a.Exception is NULL )
	)
	Order BY a.Id 
	OFFSET  (@Offset) ROWS
	FETCH NEXT (@MaxLimit) ROWS ONLY
GO
;




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetImmunizationDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetImmunizationDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetImmunizationDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Immunization detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetImmunizationDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ImmunizationName,	
	ic.ImmunizationCodeId,
	i.Note,
	i.InformationSource,
	ae.AdministrationSiteName,
	i.CreateDate,	
	cc.CompletionStatusCodeId,	
	cc.CompletionStatusName,	
	i.AdministeredDate,	
	i.AdministeredById,
	au.UserName as AdministeredByName,
	i.Status
	FROM Immunizations i	
	INNER JOIN CompletionStatusCode cc 	on cc.CompletionStatusCodeId = i.CompletionStatusCodeId
	INNER JOIN ImmunizationCode ic on ic.ImmunizationCodeId = i.ImmunizationCodeId
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = i.AdministrationSiteId
	LEFT JOIN AbpUsers au on au.Id = i.AdministeredById AND au.TenantId =  @TenantId 

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	ORDER BY i.Id
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetLifeStyleDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetLifeStyleDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetLifeStyleDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing LifeStyle detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetLifeStyleDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	l.*,
	lt.*,
	au.UserName as UpdatedByName,
	cb.UserName as CreatedByName	
	FROM LifeStyle l	
	INNER JOIN LifeStyleType lt on lt.LifeStyleTypeId = l.LifeStyleTypeId
	LEFT JOIN AbpUsers au on au.Id = l.UpdatedBy AND au.TenantId =  @TenantId 
	LEFT JOIN AbpUsers cb on cb.Id = l.CreatedBy AND cb.TenantId =  @TenantId 

	WHERE 
	l.TenantId = @TenantId 
	AND l.pid = @Pid
	AND l.Archived = 0
	ORDER BY l.Id
GO
;


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetLifeStyleDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetLifeStyleDetailByVisitIdAndPid
GO
-- ==========================================================================================
-- Entity Name:	GetLifeStyleDetailByVisitIdAndPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing LifeStyle detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetLifeStyleDetailByVisitIdAndPid
	(
		@TenantId int,
		@Pid int, 
		@VisitId bigint
	)
AS
	SET NOCOUNT ON

	SELECT 
	l.*,
	lt.*,
	au.UserName as UpdatedByName,
	cb.UserName as CreatedByName	
	FROM LifeStyle l	
	INNER JOIN LifeStyleType lt on lt.LifeStyleTypeId = l.LifeStyleTypeId
	LEFT JOIN AbpUsers au on au.Id = l.UpdatedBy AND au.TenantId =  @TenantId 
	LEFT JOIN AbpUsers cb on cb.Id = l.CreatedBy AND cb.TenantId =  @TenantId 

	WHERE 
	l.TenantId = @TenantId 
	AND l.pid = @Pid
	AND l.VisitId = @VisitId
	AND l.Archived = 0
	ORDER BY l.Id
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetSurgeryDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetSurgeryDetailByVisitIdAndPid
GO
-- ==========================================================================================
-- Entity Name:	GetSurgeryDetailByVisitIdAndPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Surgery detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetSurgeryDetailByVisitIdAndPid
	(
		@TenantId int,
		@Pid int,
		@VisitId bigint
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ICDCodePCSName,			
	ic.ICDCodePCSShortName,		
	ic.ICDCodePCSId,
	ae.AdministrationSiteName,
	cc.OutcomeCodeId,	
	cc.OutcomeCodeName,	
	au.UserName as AdministeredByName,
	sc.*,
	i.*
	FROM Surgery i	
	LEFT JOIN OutcomeCode cc 	on cc.OutcomeCodeId = i.OutcomeCodeId
	LEFT JOIN ICDCodePCS ic on ic.ICDCodePCSId = i.ICDCodePCSId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = i.AdministrationSiteId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	LEFT JOIN AbpUsers au on au.Id = i.AdministeredById AND au.TenantId =  @TenantId 
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	AND i.VisitId = @VisitId
	ORDER BY i.SurgeryDate desc
GO
;


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetSurgeryDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetSurgeryDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetSurgeryDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Surgery detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetSurgeryDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ICDCodePCSName,			
	ic.ICDCodePCSShortName,		
	ic.ICDCodePCSId,
	ae.AdministrationSiteName,
	cc.OutcomeCodeId,	
	cc.OutcomeCodeName,	
	au.UserName as AdministeredByName,
	sc.*,
	i.*
	FROM Surgery i	
	LEFT JOIN OutcomeCode cc 	on cc.OutcomeCodeId = i.OutcomeCodeId
	LEFT JOIN ICDCodePCS ic on ic.ICDCodePCSId = i.ICDCodePCSId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = i.AdministrationSiteId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	LEFT JOIN AbpUsers au on au.Id = i.AdministeredById AND au.TenantId =  @TenantId 
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	ORDER BY i.SurgeryDate desc
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetAllUserAndRole') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetAllUserAndRole
GO
-- ==========================================================================================
-- Entity Name:	GetAllUserAndRole
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing GetAllUserAndRole -- ==========================================================================================
CREATE PROCEDURE [dbo].GetAllUserAndRole
	(
		@TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT 
	r.DisplayName as RoleName,
	u.Id,
	u.UserName,
	CONCAT(u.Name, ' ',u.SurName) FullName,
	up.CalendarColor,
	up.AdministrationSiteId
	FROM AbpRoles r
	INNER JOIN AbpUserRoles ur on ur.RoleId = r.Id AND ur.TenantId = @TenantId 
	INNER JOIN AbpUsers u on ur.UserId = u.Id AND u.TenantId =  @TenantId 
	LEFT JOIN UserPreference up on up.Id = u.Id AND u.TenantId =  @TenantId 

WHERE 
r.TenantId = @TenantId 
Order BY r.DisplayName
GO
;

-- ==========================================================================================
-- Entity Name:	CheckPCSExists
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	12/16/2016 3:03:47 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ICDCodePCS table
-- ==========================================================================================
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CheckPCSExists') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CheckPCSExists
GO
CREATE PROCEDURE [dbo].CheckPCSExists
	(
	@ICDCodePCSId varchar(7)
	, @TenantId int
	)
AS
	SET NOCOUNT ON
SELECT CAST(
   CASE WHEN EXISTS(
	SELECT *  FROM ICDCodePCS WHERE Lower([ICDCodePCSId])=Lower(@ICDCodePCSId)
   AND (TenantId = @TenantId OR TenantId is null)
   ) THEN 1 
   ELSE 0 
   END 
AS BIT)
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetDiagnosisDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetDiagnosisDetailByVisitIdAndPid
GO
-- ==========================================================================================
-- Entity Name:	GetDiagnosisDetailByVisitIdAndPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Diagnosis detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetDiagnosisDetailByVisitIdAndPid
	(
		@TenantId int,
		@Pid int,
		@VisitId bigint
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ICDCodeCNName,			
	ic.ICDCodeCNShortName,		
	ic.ICDCodeCNId,
	ae.AdministrationSiteName,
	au.UserName as AdministeredByName,
	sc.*,
	i.*
	FROM Diagnosis i	
	LEFT JOIN ICDCodeCN ic on ic.ICDCodeCNId = i.ICDCodeCNId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = i.AdministrationSiteId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	LEFT JOIN AbpUsers au on au.Id = i.AdministeredById AND au.TenantId =  @TenantId 
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	AND i.VisitId = @VisitId
	ORDER BY i.DiagnosisDate desc
GO
;


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetDiagnosisDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetDiagnosisDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetDiagnosisDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing Diagnosis detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetDiagnosisDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ICDCodeCNName,			
	ic.ICDCodeCNShortName,		
	ic.ICDCodeCNId,
	ae.AdministrationSiteName,
	au.UserName as AdministeredByName,
	sc.*,
	i.*
	FROM Diagnosis i	
	LEFT JOIN ICDCodeCN ic on ic.ICDCodeCNId = i.ICDCodeCNId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = i.AdministrationSiteId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	LEFT JOIN AbpUsers au on au.Id = i.AdministeredById AND au.TenantId =  @TenantId 
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	ORDER BY i.DiagnosisDate desc
GO
;


-- ==========================================================================================
-- Entity Name:	CheckLoincCodeExists
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	12/16/2016 3:03:47 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincCode table
-- ==========================================================================================
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CheckLoincCodeExists') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CheckLoincCodeExists
GO
CREATE PROCEDURE [dbo].CheckLoincCodeExists
	(
	@LoincCodeId varchar(10)
	, @TenantId int
	)
AS
	SET NOCOUNT ON
SELECT CAST(
   CASE WHEN EXISTS(
	SELECT *  FROM LoincCode WHERE Lower([LoincCodeId])=Lower(@LoincCodeId)
   AND (TenantId = @TenantId OR TenantId is null)
   ) THEN 1 
   ELSE 0 
   END 
AS BIT)
GO


-- ==========================================================================================
-- Entity Name:	CheckCNExists
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	12/16/2016 3:03:47 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ICDCodeCN table
-- ==========================================================================================
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CheckCNExists') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CheckCNExists
GO
CREATE PROCEDURE [dbo].CheckCNExists
	(
	@ICDCodeCNId varchar(7)
	, @TenantId int
	)
AS
	SET NOCOUNT ON
SELECT CAST(
   CASE WHEN EXISTS(
	SELECT *  FROM ICDCodeCN WHERE Lower([ICDCodeCNId])=Lower(@ICDCodeCNId)
   AND (TenantId = @TenantId OR TenantId is null)
   ) THEN 1 
   ELSE 0 
   END 
AS BIT)
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetFamilyHistoryDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetFamilyHistoryDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetFamilyHistoryDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing FamilyHistory detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetFamilyHistoryDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ICDCodeCNName,			
	ic.ICDCodeCNShortName,		
	ic.ICDCodeCNId,
	ae.RelationshipCodeName,
	sc.*,
	i.*
	FROM FamilyHistory i	
	LEFT JOIN ICDCodeCN ic on ic.ICDCodeCNId = i.ICDCodeCNId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN RelationshipCode ae on ae.RelationshipCodeId = i.RelationshipCodeId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	ORDER BY i.CreateDate desc
GO
;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetProcedureOrderDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetProcedureOrderDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetProcedureOrderDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing ProcedureOrder detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetProcedureOrderDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.LongCommonName,
	ic.ShortName,
	ic.LoincCodeId,
	ic.ClassName,
	ae.PriorityCodeName,
	sc.StatusCodeName,
	au.UserName as OrderdByName,
	i.*
	FROM ProcedureOrder i	
	LEFT JOIN LoincCode ic on ic.LoincCodeId = i.LoincCodeId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN PriorityCode ae on ae.PriorityCodeId = i.PriorityCodeId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	LEFT JOIN AbpUsers au on au.Id = i.OrderdById AND au.TenantId =  @TenantId 
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	ORDER BY i.CreateDate desc
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetProcedureOrderDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetProcedureOrderDetailByVisitIdAndPid
GO
-- ==========================================================================================
-- Entity Name:	GetProcedureOrderDetailByVisitIdAndPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing ProcedureOrder detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetProcedureOrderDetailByVisitIdAndPid
	(
		@TenantId int,
		@Pid int,
		@VisitId bigint
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.LongCommonName,
	ic.ShortName,
	ic.LoincCodeId,
	ic.ClassName,
	ae.PriorityCodeName,
	sc.StatusCodeName,
	au.UserName as OrderdByName,
	i.*
	FROM ProcedureOrder i	
	LEFT JOIN LoincCode ic on ic.LoincCodeId = i.LoincCodeId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN PriorityCode ae on ae.PriorityCodeId = i.PriorityCodeId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	LEFT JOIN AbpUsers au on au.Id = i.OrderdById AND au.TenantId =  @TenantId 
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.VisitId = @VisitId
	ORDER BY i.CreateDate desc
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetOrderSpecimenDetailByOrderId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetOrderSpecimenDetailByOrderId
GO
-- ==========================================================================================
-- Entity Name:	GetOrderSpecimenDetailByOrderId
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing OrderSpecimen detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetOrderSpecimenDetailByOrderId
	(
		@Id bigint,
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ae.AdministrationSiteName,
	sc.StatusCodeName,
	sp.SpecimenCodeName,
	au.UserName as CollectedByName,
	i.*
	FROM OrderSpecimen i	
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = i.AdministrationSiteId
	LEFT JOIN StatusCode sc on sc.StatusCodeId = i.StatusCodeId
	LEFT JOIN SpecimenCode sp on sp.SpecimenCodeId = i.SpecimenCodeId
	LEFT JOIN AbpUsers au on au.Id = i.CollectedById AND au.TenantId =  @TenantId 
	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	AND i.OrderId = @Id
	ORDER BY i.CreateDate desc
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetOrderResultDetailByOrderId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetOrderResultDetailByOrderId
GO
-- ==========================================================================================
-- Entity Name:	GetOrderResultDetailByOrderId
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing OrderResult detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetOrderResultDetailByOrderId
	(
		@Id bigint,
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ShortName,
	ic.UnitsAndRange,
	ic.UnitsRequired,
	ic.SubmittedUnits,
	ic.ExampleUnits,
	ic.ExampleUcumUnits,
	ic.ClassName,
	Concat(pc.LongCommonName,' ','(', i.ParentLoincCodeId,')') as ParentLonicLongName,
	rs.*,
	i.*
	FROM OrderResult i	
	LEFT JOIN LoincCode ic on ic.LoincCodeId = i.LoincCodeId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN LoincCode pc on pc.LoincCodeId = i.ParentLoincCodeId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN ResultStatusCode rs on rs.ResultStatusCodeId = i.ResultStatusCodeId


	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	AND i.OrderId = @Id
	ORDER BY i.UpdateDate desc
GO

-- ==========================================================================================
-- Entity Name:	CheckLoincExists
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	12/16/2016 3:03:47 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincCode table
-- ==========================================================================================
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CheckLoincExists') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CheckLoincExists
GO
CREATE PROCEDURE [dbo].CheckLoincExists
	(
	@LoincCodeId varchar(7)
	, @TenantId int
	)
AS
	SET NOCOUNT ON
SELECT CAST(
   CASE WHEN EXISTS(
	SELECT *  FROM LoincCode WHERE [LoincCodeId]=@LoincCodeId
   AND (TenantId = @TenantId OR TenantId is null)
   ) THEN 1 
   ELSE 0 
   END 
AS BIT)
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetParentLoincCodes') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetParentLoincCodes
GO
-- ==========================================================================================
-- Entity Name:	GetParentLoincCodes
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing distinct ParentLoincCodes
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetParentLoincCodes
	(
		@Loinccodeid VARCHAR(10)
	)
AS
WITH name_tree
     AS (SELECT Id,
                Parentid,
                Parentname,
                Parentloinccodeid
         FROM   Loincpanelcode
         WHERE  Loinccodeid = @Loinccodeid
         -- this is the starting point you want in your recursion
         UNION ALL
         SELECT c.Id,
                c.Parentid,
                c.Parentname,
                c.Parentloinccodeid
         FROM   Loincpanelcode c
                JOIN name_tree p
                  ON p.Parentid = c.Id -- this is the recursion
                     AND c.Id <> c.Parentid)
SELECT DISTINCT ParentName as LongCommonName,
                ParentLoincCodeId as LoincCodeId
FROM   name_tree  
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetChildrenLoincCodes') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetChildrenLoincCodes
GO
-- ==========================================================================================
-- Entity Name:	GetChildrenLoincCodes
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing distinct ParentLoincCodes
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetChildrenLoincCodes
	(
		@LoincCodeId VARCHAR(10)
	)
AS
WITH name_tree
     AS (SELECT Id,
                Loinccodeid,
                Parentloinccodeid,
                Parentid,
                NAME,
                Parentname
         FROM   Loincpanelcode
         WHERE  Parentloinccodeid = @LoincCodeId
         -- this is the starting point you want in your recursion
         UNION ALL
         SELECT c.Id,
                c.Loinccodeid,
                c.Parentloinccodeid,
                c.Parentid,
                c.NAME,
                c.Parentname
         FROM   Loincpanelcode c
                JOIN name_tree p
                  ON p.Id = c.Parentid -- this is the recursion
                     AND c.Id <> c.Parentid)
SELECT DISTINCT Loinccodeid,
                Parentloinccodeid,
                NAME,
                HasChildren= Cast (CASE
                                     WHEN EXISTS (SELECT 1
                                                  FROM   name_tree i
                                                  WHERE  i.Parentid = o.Id) THEN
                                     1
                                     ELSE 0
                                   END AS BIT)
FROM   name_tree o   
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetLoincCodeByLoincCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetLoincCodeByLoincCodeId
GO
-- ==========================================================================================
-- Entity Name:	GetLoincCodeByLoincCodeId
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing OrderResult detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetLoincCodeByLoincCodeId
	(
	@LoincCodeId varchar(10)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincCode WHERE [LoincCodeId]=@LoincCodeId
   AND (TenantId = @TenantId OR TenantId is null)
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].UpdateOrderResultStatus') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].UpdateOrderResultStatus
GO
-- ==========================================================================================
-- Entity Name:	UpdateOrderResultStatus
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing LifeStyle detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].UpdateOrderResultStatus
	(
		@TenantId int,
		@Id bigint,
		@ResultStatusCodeId int,
		@UpdateDate datetime,
		@UpdatedBy int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	UPDATE OrderResult
	SET ResultStatusCodeId = @ResultStatusCodeId
	, UpdateDate = @UpdateDate
	, UpdatedBy = @UpdatedBy
	WHERE 
	TenantId = @TenantId 
	AND pid = @Pid
	AND Archived = 0
	AND Id=@Id
GO
;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetActiveVisitByLoggedInUser') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetActiveVisitByLoggedInUser
GO
-- ==========================================================================================
-- Entity Name:	GetActiveVisitByLoggedInUser
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for searching by Name from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetActiveVisitByLoggedInUser
	(
		@TenantId int,
		@LoggedInUserId bigint,
		@SkipCount int,
		@PageSize int,
		@FilterByLoggedUser bit
	)
AS
	SET NOCOUNT ON

	SELECT 
	pd.[Pid],
	pd.[Fname],
	pd.[Lname],
	pd.[Mname],
	pd.[DOB],
	pd.[Gender],
	v.*
	FROM PatientData pd
	INNER JOIN Visit v ON v.Pid = pd.Pid AND v.TenantId = pd.TenantId
	WHERE 
	pd.TenantId = @TenantId 
	AND pd.CurrentlyInVisit = 1
	AND v.VisitStatusCodeId < 6  --Discharged
	AND (@FilterByLoggedUser = 0 OR (v.DoctorId = @LoggedInUserId OR v.NurseId = @LoggedInUserId))
	ORDER BY v.UpdateDate desc
	OFFSET @SkipCount ROWS
	FETCH NEXT @PageSize ROWS ONLY
GO
;
	
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].UpdatePatientCurrentlyInVisit') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].UpdatePatientCurrentlyInVisit
GO
-- ==========================================================================================
-- Entity Name:	UpdatePatientCurrentlyInVisit
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for searching by Name from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].UpdatePatientCurrentlyInVisit
	(
		@TenantId int,
		@Pid bigint,
		@UpdatedBy bigint,
		@UpdateDate datetime
	)
AS
	SET NOCOUNT ON

	UPDATE PatientData
	SET [CurrentlyInVisit] = 1,
	[UpdateDate] = @UpdateDate,
	[UpdatedBy] = @UpdatedBy
	WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
GO
;


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetVisitDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetVisitDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetVisitDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for searching by Name from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetVisitDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT TOP  1
	v.*
	FROM PatientData pd
	INNER JOIN Visit v on v.pid = pd.pid AND v.TenantId = pd.TenantId
	WHERE 
	pd.TenantId = @TenantId 
	AND pd.pid = @Pid
	AND pd.CurrentlyInVisit = 1
	AND v.VisitStatusCodeId < 6  --Discharged
	Order by UpdateDate desc
GO
;


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetOrderResultDetailByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetOrderResultDetailByPid
GO
-- ==========================================================================================
-- Entity Name:	GetOrderResultDetailByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing OrderResult detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetOrderResultDetailByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	ic.ShortName,
	ic.ClassName,
	Concat(pc.LongCommonName,' ','(', i.ParentLoincCodeId,')') as ParentLonicLongName,
	rs.*,
	ab.*,
	u.UserName as ResultByUserName,
	ae.AdministrationSiteName,
	i.*
	FROM OrderResult i	
	LEFT JOIN LoincCode ic on ic.LoincCodeId = i.LoincCodeId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN LoincCode pc on pc.LoincCodeId = i.ParentLoincCodeId AND (ic.TenantId is NULL OR ic.TenantId = @TenantId)
	LEFT JOIN ResultStatusCode rs on rs.ResultStatusCodeId = i.ResultStatusCodeId
	LEFT JOIN AbnormalCode ab on ab.AbnormalCodeId = i.AbnormalCodeId
	LEFT JOIN AbpUsers u on u.id = i.ResultById and u.TenantId = i.TenantId
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = i.AdministrationSiteId




	

	WHERE 
	i.TenantId = @TenantId 
	AND i.pid = @Pid
	AND i.Archived = 0
	ORDER BY i.UpdateDate desc
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetVisitHistoryByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetVisitHistoryByPid
GO
-- ==========================================================================================
-- Entity Name:	GetVisitHistoryByPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for searching by Name from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetVisitHistoryByPid
	(
		@TenantId int,
		@Pid int
	)
AS
	SET NOCOUNT ON

	SELECT 
	v.*,
	vc.VisitCodeName,
	ae.AdministrationSiteName,
	au.UserName as DoctorName
	FROM Visit v
	LEFT JOIN VisitCode vc ON v.VisitCodeId = vc.VisitCodeId
	LEFT JOIN AdministrationSite ae on ae.AdministrationSiteId = v.AdministrationSiteId
	LEFT JOIN AbpUsers au on au.Id = v.DoctorId AND au.TenantId =  @TenantId 

	WHERE v.TenantId = @TenantId 
	AND v.pid = @Pid
	Order by UpdateDate desc
GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetAllReviewOfSystemCode') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetAllReviewOfSystemCode
GO
-- ==========================================================================================
-- Entity Name:	GetAllReviewOfSystemCode
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing ReviewOfSystemCode detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetAllReviewOfSystemCode
AS
	SET NOCOUNT ON

	SELECT 
	r.*, g.*, 1 as NormalLimits
	FROM ReviewOfSystemCode r
	INNER JOIN ReviewOfSystemGroupCode g ON g.ReviewOfSystemGroupCodeId = r.ReviewOfSystemGroupCodeId
	GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPatientReviewOfSystemDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPatientReviewOfSystemDetailByVisitIdAndPid
GO
-- ==========================================================================================
-- Entity Name:	GetPatientReviewOfSystemDetailByVisitIdAndPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing ReviewOfSystemCode detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPatientReviewOfSystemDetailByVisitIdAndPid(
		@TenantId int,
		@Pid int,
		@VisitId bigint,
		@IsShortCode bit

)
AS
	SET NOCOUNT ON

	SELECT 
	r.*, g.*, p.NormalLimits, p.Note
	FROM PatientReviewOfSystem p
	INNER JOIN ReviewOfSystemCode r ON p.ReviewOfSystemCodeId = r.ReviewOfSystemCodeId AND r.IsShortCode = @IsShortCode
	INNER JOIN ReviewOfSystemGroupCode g ON g.ReviewOfSystemGroupCodeId = r.ReviewOfSystemGroupCodeId

	WHERE p.TenantId = @TenantId
	AND	  p.Pid = @Pid
	AND	  p.VisitId = @VisitId
	GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DeletePatientReviewOfSystemDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DeletePatientReviewOfSystemDetailByVisitIdAndPid
GO
-- ==========================================================================================
-- Entity Name:	DeletePatientReviewOfSystemDetailByVisitIdAndPid
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing ReviewOfSystemCode detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DeletePatientReviewOfSystemDetailByVisitIdAndPid(
		@TenantId int,
		@Pid int,
		@VisitId bigint,
		@IsShortCode bit

)
AS
	SET NOCOUNT ON

	DELETE p
	FROM PatientReviewOfSystem p
	INNER JOIN ReviewOfSystemCode r ON p.ReviewOfSystemCodeId = r.ReviewOfSystemCodeId AND r.IsShortCode = @IsShortCode
	WHERE TenantId = @TenantId
	AND	  Pid = @Pid
	AND	  VisitId = @VisitId
	GO


	
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetAppointmentByMonth') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetAppointmentByMonth
GO
-- ==========================================================================================
-- Entity Name:	GetAppointmentByMonth
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getiing GetAppointmentByMonth detail that is in interactive table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetAppointmentByMonth(
		@TenantId int,
		@ViewDate datetime2

)
AS
	SET NOCOUNT ON

	SELECT 
	a.*, 
	up.CalendarColor,
	CONCAT(u.Name, ' ',u.SurName) FullName
	FROM Appointment a
	LEFT JOIN UserPreference up on up.Id = a.ProviderId AND up.TenantId =  @TenantId 
	INNER JOIN AppointmentStatusCode appts on appts.AppointmentStatusCodeId = a.AppointmentStatusCodeId	
	INNER JOIN AbpUsers u on a.ProviderId = u.Id and u.TenantId = @TenantId 	
	INNER JOIN AbpUserRoles ur on ur.UserId = u.Id and u.TenantId = @TenantId 	
	INNER JOIN AbpRoles r on r.id = ur.RoleId and u.TenantId = @TenantId and r.DisplayName = 'Doctor'

	WHERE a.TenantId = @TenantId
	AND a.StartDate Between dateadd(month,datediff(month,0,@ViewDate),0) AND dateadd(day,-1,dateadd(month,datediff(month,-1,@ViewDate),0))
	AND appts.AppointmentStatusCodeId = 1 -- Active
	GO



	
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CheckAppointmentOverlap') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CheckAppointmentOverlap
GO
-- ==========================================================================================
-- Entity Name:	CheckAppointmentOverlap
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for searching by Name from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].CheckAppointmentOverlap
	(
		@TenantId int,
		@ProviderId bigint,
		@StartDate datetime2,
		@EndDate datetime2,
		@Id bigint
	)
AS
	SET NOCOUNT ON

	SELECT 
	CAST (Count(*)  AS BIT) as Overlap
	FROM Appointment a
	INNER JOIN AppointmentStatusCode appts on appts.AppointmentStatusCodeId = a.AppointmentStatusCodeId	

	WHERE a.TenantId = @TenantId 
	AND a.ProviderId = @ProviderId
	AND (a.StartDate < @EndDate AND @StartDate < a.EndDate)
	AND a.Id <> @Id
	AND appts.AppointmentStatusCodeId = 1 -- Active

GO
;

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetAppointmentByDate') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetAppointmentByDate
GO
-- ==========================================================================================
-- Entity Name:	GetAppointmentByDate
-- Create date:	6/26/2016 8:25:34 PM
-- Description:	This stored procedure is intended for getting Appointment By Date
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetAppointmentByDate
	(
		@TenantId int,
		@ViewDate datetime2,
		@AdministrationSiteId int
	)
AS
	SET NOCOUNT ON

	SELECT 
	a.*,
	u.UserName as ProviderName,
	ae.AdministrationSiteName,
	ac.AppointmentCodeName,
	acs.AppointmentStatusCodeName
	FROM Appointment a
	LEFT JOIN AbpUsers u on a.ProviderId = u.Id and u.TenantId = @TenantId 	
	INNER JOIN AdministrationSite ae on ae.AdministrationSiteId = a.AdministrationSiteId
	INNER JOIN AppointmentCode ac on ac.appointmentCodeId = a.appointmentCodeId
	INNER JOIN AppointmentStatusCode acs on acs.AppointmentStatusCodeId = a.AppointmentStatusCodeId
	WHERE a.TenantId = @TenantId 
	AND CONVERT(date, a.StartDate) = CONVERT(date, @ViewDate)
	AND a.AdministrationSiteId = @AdministrationSiteId
	Order by UpdateDate desc
GO
;
