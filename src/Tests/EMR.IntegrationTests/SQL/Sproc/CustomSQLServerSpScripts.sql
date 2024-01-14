
    



























IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	FamilyHistory_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_ArchiveAndInsert
(
	
	@Id bigint,
	@Pid bigint,
	@VisitId bigint,
	@Archived bit,
	@ParentId bigint = NULL,
	@TenantId int,
	@RelationshipCodeId int,
	@ICDCodeCNId varchar(7),
	@Note nvarchar(max) = NULL,
	@StatusCodeId int = NULL,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE FamilyHistory SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [Id]=@Id
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO FamilyHistory
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[RelationshipCodeId] ,[ICDCodeCNId] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@RelationshipCodeId ,@ICDCodeCNId ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 










IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	Immunizations_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_ArchiveAndInsert
(
	
	@Id bigint,
	@Pid bigint = NULL,
	@VisitId bigint,
	@Archived bit,
	@ParentId bigint = NULL,
	@TenantId int = NULL,
	@ImmunizationCodeId int = NULL,
	@AdministeredDate datetime2 = NULL,
	@AdministeredById bigint = NULL,
	@Note nvarchar(max) = NULL,
	@ExpirationDate date = NULL,
	@CompletionStatusCodeId int = NULL,
	@Status varchar(20) = NULL,
	@InformationSource nvarchar(31) = NULL,
	@AdministrationSiteId int,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE Immunizations SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [Id]=@Id
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO Immunizations
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[ImmunizationCodeId] ,[AdministeredDate] ,[AdministeredById] ,[Note] ,[ExpirationDate] ,[CompletionStatusCodeId] ,[Status] ,[InformationSource] ,[AdministrationSiteId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@ImmunizationCodeId ,@AdministeredDate ,@AdministeredById ,@Note ,@ExpirationDate ,@CompletionStatusCodeId ,@Status ,@InformationSource ,@AdministrationSiteId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	LifeStyle_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_ArchiveAndInsert
(
	
	@Id bigint,
	@Pid bigint,
	@VisitId bigint,
	@Archived bit,
	@ParentId bigint = NULL,
	@TenantId int,
	@LifeStyleTypeId int,
	@QuitDate datetime2 = NULL,
	@CurrentlyActive bit,
	@Note nvarchar(max) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE LifeStyle SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [Id]=@Id
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO LifeStyle
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[LifeStyleTypeId] ,[QuitDate] ,[CurrentlyActive] ,[Note] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@LifeStyleTypeId ,@QuitDate ,@CurrentlyActive ,@Note ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 
















IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderResult_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderResult_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	OrderResult_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	OrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderResult_ArchiveAndInsert
(
	
	@Id bigint,
	@OrderId bigint,
	@Pid bigint,
	@TenantId int,
	@ResultDate datetime2,
	@Archived bit,
	@ParentId bigint = NULL,
	@ResultById bigint,
	@ParentLoincCodeId varchar(10) = NULL,
	@LoincCodeId varchar(10),
	@ResultDataCodeId int,
	@ResultData varchar(255),
	@AdministrationSiteId int = NULL,
	@Unit varchar(10) = NULL,
	@RangeValue varchar(255) = NULL,
	@AbnormalCodeId int,
	@Note nvarchar(max) = NULL,
	@ResultStatusCodeId int = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE OrderResult SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [Id]=@Id
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO OrderResult
			([OrderId] ,[Pid] ,[TenantId] ,[ResultDate] ,[Archived] ,[ParentId] ,[ResultById] ,[ParentLoincCodeId] ,[LoincCodeId] ,[ResultDataCodeId] ,[ResultData] ,[AdministrationSiteId] ,[Unit] ,[RangeValue] ,[AbnormalCodeId] ,[Note] ,[ResultStatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@OrderId ,@Pid ,@TenantId ,@ResultDate ,@Archived ,@ParentId ,@ResultById ,@ParentLoincCodeId ,@LoincCodeId ,@ResultDataCodeId ,@ResultData ,@AdministrationSiteId ,@Unit ,@RangeValue ,@AbnormalCodeId ,@Note ,@ResultStatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 










IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderSpecimen_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderSpecimen_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	OrderSpecimen_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	OrderSpecimen table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderSpecimen_ArchiveAndInsert
(
	
	@Id bigint,
	@OrderId bigint,
	@Pid bigint,
	@TenantId int,
	@Archived bit,
	@ParentId bigint = NULL,
	@CollectedDate datetime2,
	@CollectedById bigint,
	@Note nvarchar(max) = NULL,
	@StatusCodeId int,
	@AdministrationSiteId int = NULL,
	@SpecimenNumber nvarchar(100) = NULL,
	@SpecimenCodeId int,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE OrderSpecimen SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [Id]=@Id
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO OrderSpecimen
			([OrderId] ,[Pid] ,[TenantId] ,[Archived] ,[ParentId] ,[CollectedDate] ,[CollectedById] ,[Note] ,[StatusCodeId] ,[AdministrationSiteId] ,[SpecimenNumber] ,[SpecimenCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@OrderId ,@Pid ,@TenantId ,@Archived ,@ParentId ,@CollectedDate ,@CollectedById ,@Note ,@StatusCodeId ,@AdministrationSiteId ,@SpecimenNumber ,@SpecimenCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	PatientAllergy_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_ArchiveAndInsert
(
	
	@PatientAllergyId bigint,
	@Pid bigint,
	@VisitId bigint,
	@Archived bit,
	@ParentId bigint = NULL,
	@TenantId int,
	@AllergyName nvarchar(1000),
	@AllergyTypeId int,
	@ReactionName nvarchar(1000),
	@SeverityId int,
	@AllergyCategoryCodeId int,
	@StartDate datetime2 = NULL,
	@EndDate datetime2 = NULL,
	@Note ntext = NULL,
	@Status varchar(20) = NULL,
	@Provider bigint,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE PatientAllergy SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [PatientAllergyId]=@PatientAllergyId
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO PatientAllergy
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[AllergyName] ,[AllergyTypeId] ,[ReactionName] ,[SeverityId] ,[AllergyCategoryCodeId] ,[StartDate] ,[EndDate] ,[Note] ,[Status] ,[Provider] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@AllergyName ,@AllergyTypeId ,@ReactionName ,@SeverityId ,@AllergyCategoryCodeId ,@StartDate ,@EndDate ,@Note ,@Status ,@Provider ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [PatientAllergyId];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 


















IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	Prescription_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_ArchiveAndInsert
(
	
	@PrescriptionId bigint,
	@Pid bigint,
	@VisitId bigint,
	@Archived bit,
	@ParentId bigint = NULL,
	@TenantId int,
	@DrugId int,
	@RxNormName nvarchar(1000) = NULL,
	@DoseUnitCodeId int,
	@DoseSize real,
	@Dosage int,
	@FrequencyCodeId int,
	@DrugRouteCodeId int,
	@DrugFormCodeId int,
	@Quantity int,
	@Refills int = NULL,
	@ProviderId int,
	@StartDate datetime2,
	@Duration int,
	@EndDate datetime = NULL,
	@RefillDate datetime = NULL,
	@TherapyCodeId int,
	@SubstitutionAllowed bit,
	@Note nvarchar(max) = NULL,
	@StatusCodeId int = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE Prescription SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [PrescriptionId]=@PrescriptionId
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO Prescription
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[DrugId] ,[RxNormName] ,[DoseUnitCodeId] ,[DoseSize] ,[Dosage] ,[FrequencyCodeId] ,[DrugRouteCodeId] ,[DrugFormCodeId] ,[Quantity] ,[Refills] ,[ProviderId] ,[StartDate] ,[Duration] ,[EndDate] ,[RefillDate] ,[TherapyCodeId] ,[SubstitutionAllowed] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@DrugId ,@RxNormName ,@DoseUnitCodeId ,@DoseSize ,@Dosage ,@FrequencyCodeId ,@DrugRouteCodeId ,@DrugFormCodeId ,@Quantity ,@Refills ,@ProviderId ,@StartDate ,@Duration ,@EndDate ,@RefillDate ,@TherapyCodeId ,@SubstitutionAllowed ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [PrescriptionId];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 






































IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	Diagnosis_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_ArchiveAndInsert
(
	
	@Id bigint,
	@Pid bigint,
	@VisitId bigint,
	@Archived bit,
	@ParentId bigint = NULL,
	@TenantId int,
	@ICDCodeCNId varchar(7),
	@DiagnosisDate datetime2 = NULL,
	@AdministeredById bigint = NULL,
	@AdministrationSiteId int = NULL,
	@Note nvarchar(max) = NULL,
	@StatusCodeId int = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE Diagnosis SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [Id]=@Id
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO Diagnosis
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[ICDCodeCNId] ,[DiagnosisDate] ,[AdministeredById] ,[AdministrationSiteId] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@ICDCodeCNId ,@DiagnosisDate ,@AdministeredById ,@AdministrationSiteId ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_ArchiveAndInsert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_ArchiveAndInsert
GO

-- ==========================================================================================
-- Entity Name:	Surgery_ArchiveAndInsert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_ArchiveAndInsert
(
	
	@Id bigint,
	@Pid bigint,
	@VisitId bigint,
	@Archived bit,
	@ParentId bigint = NULL,
	@TenantId int,
	@ICDCodePCSId varchar(7),
	@SurgeryDate datetime2 = NULL,
	@AdministeredById bigint = NULL,
	@AdministrationSiteId int = NULL,
	@OutcomeCodeId int,
	@Note nvarchar(max) = NULL,
	@StatusCodeId int = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	BEGIN TRY
    BEGIN TRANSACTION

  UPDATE Surgery SET 
	Archived = 1,
	UpdateDate = @UpdateDate,
	UpdatedBy = @UpdatedBy
	WHERE [Id]=@Id
  And Pid = @Pid
  And Archived = 0
   AND TenantId = @TenantId

	INSERT INTO Surgery
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[ICDCodePCSId] ,[SurgeryDate] ,[AdministeredById] ,[AdministrationSiteId] ,[OutcomeCodeId] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@ICDCodePCSId ,@SurgeryDate ,@AdministeredById ,@AdministrationSiteId ,@OutcomeCodeId ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];

    COMMIT TRAN -- Transaction Success!
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN --RollBack in case of Error

   DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
GO
 





    













IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetVisitNoteDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetVisitNoteDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetVisitNoteDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetVisitNoteDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM VisitNote
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	Order by UpdateDate desc
GO















IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetFamilyHistoryDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetFamilyHistoryDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetFamilyHistoryDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetFamilyHistoryDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM FamilyHistory
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	AND Archived = 0
 
	Order by UpdateDate desc
GO











IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetImmunizationsDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetImmunizationsDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetImmunizationsDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetImmunizationsDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM Immunizations
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	AND Archived = 0
 
	Order by UpdateDate desc
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetLifeStyleDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetLifeStyleDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetLifeStyleDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetLifeStyleDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM LifeStyle
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	AND Archived = 0
 
	Order by UpdateDate desc
GO

























IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPatientVitalDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPatientVitalDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetPatientVitalDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPatientVitalDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM PatientVital
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	Order by CreateDate desc
GO







IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPatientAllergyDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPatientAllergyDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetPatientAllergyDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPatientAllergyDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM PatientAllergy
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	AND Archived = 0
 
	Order by UpdateDate desc
GO

















IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPatientReviewOfSystemDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPatientReviewOfSystemDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetPatientReviewOfSystemDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPatientReviewOfSystemDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM PatientReviewOfSystem
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	Order by CreateDate desc
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetPrescriptionDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetPrescriptionDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetPrescriptionDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetPrescriptionDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM Prescription
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	AND Archived = 0
 
	Order by UpdateDate desc
GO















IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetProcedureOrderDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetProcedureOrderDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetProcedureOrderDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetProcedureOrderDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM ProcedureOrder
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	Order by UpdateDate desc
GO

























IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetDiagnosisDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetDiagnosisDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetDiagnosisDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetDiagnosisDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM Diagnosis
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	AND Archived = 0
 
	Order by UpdateDate desc
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].GetSurgeryDetailByVisitIdAndPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].GetSurgeryDetailByVisitIdAndPid
GO

-- ==========================================================================================
-- Entity Name:	GetSurgeryDetailByVisitIdAndPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:35 PM
-- Description:	This stored procedure is intended for updating 	Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].GetSurgeryDetailByVisitIdAndPid
(
		@TenantId int,
		@Pid int,
		@VisitId bigint)
AS
SELECT * 
FROM Surgery
WHERE 
	TenantId = @TenantId 
	AND Pid = @Pid
	AND VisitId = @VisitId
	
	AND Archived = 0
 
	Order by UpdateDate desc
GO






  