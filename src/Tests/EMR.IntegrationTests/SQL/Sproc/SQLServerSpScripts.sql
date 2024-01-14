
		
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentCategoryCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentCategoryCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	DocumentCategoryCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:24 PM
-- Description:	This stored procedure is intended for selecting all rows from DocumentCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentCategoryCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM DocumentCategoryCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentCategoryCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentCategoryCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	DocumentCategoryCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:24 PM
-- Description:	This stored procedure is intended for inserting values to DocumentCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentCategoryCode_Insert
(
	
	@DocumentCategoryCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO DocumentCategoryCode
			([DocumentCategoryCodeName] )
	VALUES	(@DocumentCategoryCodeName )
    

	SELECT  Scope_Identity() AS [DocumentCategoryCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentCategoryCode_GetByDocumentCategoryCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentCategoryCode_GetByDocumentCategoryCodeId
GO

-- ==========================================================================================
-- Entity Name:	DocumentCategoryCode_GetByDocumentCategoryCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:24 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DocumentCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentCategoryCode_GetByDocumentCategoryCodeId
	(
	@DocumentCategoryCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DocumentCategoryCode WHERE [DocumentCategoryCodeId]=@DocumentCategoryCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentCategoryCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentCategoryCode_Update
GO

-- ==========================================================================================
-- Entity Name:	DocumentCategoryCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:24 PM
-- Description:	This stored procedure is intended for updating 	DocumentCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentCategoryCode_Update
(
	
	@DocumentCategoryCodeId int,
	@DocumentCategoryCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE DocumentCategoryCode SET 

		[DocumentCategoryCodeName] = @DocumentCategoryCodeName 
	WHERE [DocumentCategoryCodeId]=@DocumentCategoryCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentOrderResult_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentOrderResult_GetALL
GO
-- ==========================================================================================
-- Entity Name:	DocumentOrderResult_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from DocumentOrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentOrderResult_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM DocumentOrderResult
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentOrderResult_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentOrderResult_Insert
GO
-- ==========================================================================================
-- Entity Name:	DocumentOrderResult_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to DocumentOrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentOrderResult_Insert
(
	
	@OrderResultId bigint
)
AS
	SET NOCOUNT ON

	INSERT INTO DocumentOrderResult
			([OrderResultId] )
	VALUES	(@OrderResultId )
    

	SELECT  Scope_Identity() AS [DocumentId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentOrderResult_GetByDocumentId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentOrderResult_GetByDocumentId
GO

-- ==========================================================================================
-- Entity Name:	DocumentOrderResult_GetByDocumentId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DocumentOrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentOrderResult_GetByDocumentId
	(
	@DocumentId bigint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DocumentOrderResult WHERE [DocumentId]=@DocumentId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentOrderResult_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentOrderResult_Update
GO

-- ==========================================================================================
-- Entity Name:	DocumentOrderResult_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	DocumentOrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentOrderResult_Update
(
	
	@DocumentId bigint,
	@OrderResultId bigint
)
AS
	SET NOCOUNT ON

	UPDATE DocumentOrderResult SET 

		[OrderResultId] = @OrderResultId 
	WHERE [DocumentId]=@DocumentId
   
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentOrderResult_GetByOrderResultId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentOrderResult_GetByOrderResultId
GO

-- ==========================================================================================
-- Entity Name:	DocumentOrderResult_GetByOrderResultId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DocumentOrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentOrderResult_GetByOrderResultId
	(
	@OrderResultId bigint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DocumentOrderResult WHERE [OrderResultId]=@OrderResultId   
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Visit_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Visit_GetALL
GO
-- ==========================================================================================
-- Entity Name:	Visit_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from Visit table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Visit_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM Visit
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Visit_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Visit_Insert
GO
-- ==========================================================================================
-- Entity Name:	Visit_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to Visit table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Visit_Insert
(
	
	@Pid bigint,
	@TenantId int,
	@VisitStatusCodeId int,
	@VisitCodeId int,
	@AdministrationSiteId int = NULL,
	@DoctorId bigint,
	@NurseId bigint,
	@Reason nvarchar(1500) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	INSERT INTO Visit
			([Pid] ,[TenantId] ,[VisitStatusCodeId] ,[VisitCodeId] ,[AdministrationSiteId] ,[DoctorId] ,[NurseId] ,[Reason] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@TenantId ,@VisitStatusCodeId ,@VisitCodeId ,@AdministrationSiteId ,@DoctorId ,@NurseId ,@Reason ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Visit_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Visit_GetById
GO

-- ==========================================================================================
-- Entity Name:	Visit_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Visit table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Visit_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Visit WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Visit_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Visit_Update
GO

-- ==========================================================================================
-- Entity Name:	Visit_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	Visit table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Visit_Update
(
	
	@Id bigint,
	@Pid bigint,
	@TenantId int,
	@VisitStatusCodeId int,
	@VisitCodeId int,
	@AdministrationSiteId int = NULL,
	@DoctorId bigint,
	@NurseId bigint,
	@Reason nvarchar(1500) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	UPDATE Visit SET 

		[Pid] = @Pid ,
		[TenantId] = @TenantId ,
		[VisitStatusCodeId] = @VisitStatusCodeId ,
		[VisitCodeId] = @VisitCodeId ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[DoctorId] = @DoctorId ,
		[NurseId] = @NurseId ,
		[Reason] = @Reason ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Visit_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Visit_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	Visit_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Visit table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Visit_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Visit WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Visit_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Visit_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	Visit_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Visit table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Visit_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Visit WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentTypeCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentTypeCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	DocumentTypeCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from DocumentTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentTypeCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM DocumentTypeCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentTypeCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentTypeCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	DocumentTypeCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to DocumentTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentTypeCode_Insert
(
	
	@DocumentTypeCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO DocumentTypeCode
			([DocumentTypeCodeName] )
	VALUES	(@DocumentTypeCodeName )
    

	SELECT  Scope_Identity() AS [DocumentTypeCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentTypeCode_GetByDocumentTypeCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentTypeCode_GetByDocumentTypeCodeId
GO

-- ==========================================================================================
-- Entity Name:	DocumentTypeCode_GetByDocumentTypeCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DocumentTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentTypeCode_GetByDocumentTypeCodeId
	(
	@DocumentTypeCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DocumentTypeCode WHERE [DocumentTypeCodeId]=@DocumentTypeCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DocumentTypeCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DocumentTypeCode_Update
GO

-- ==========================================================================================
-- Entity Name:	DocumentTypeCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	DocumentTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DocumentTypeCode_Update
(
	
	@DocumentTypeCodeId int,
	@DocumentTypeCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE DocumentTypeCode SET 

		[DocumentTypeCodeName] = @DocumentTypeCodeName 
	WHERE [DocumentTypeCodeId]=@DocumentTypeCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	VisitCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from VisitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM VisitCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	VisitCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to VisitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitCode_Insert
(
	
	@VisitCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO VisitCode
			([VisitCodeName] )
	VALUES	(@VisitCodeName )
    

	SELECT  Scope_Identity() AS [VisitCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitCode_GetByVisitCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitCode_GetByVisitCodeId
GO

-- ==========================================================================================
-- Entity Name:	VisitCode_GetByVisitCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from VisitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitCode_GetByVisitCodeId
	(
	@VisitCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM VisitCode WHERE [VisitCodeId]=@VisitCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitCode_Update
GO

-- ==========================================================================================
-- Entity Name:	VisitCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	VisitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitCode_Update
(
	
	@VisitCodeId int,
	@VisitCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE VisitCode SET 

		[VisitCodeName] = @VisitCodeName 
	WHERE [VisitCodeId]=@VisitCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DoseUnitCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DoseUnitCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	DoseUnitCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from DoseUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DoseUnitCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM DoseUnitCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DoseUnitCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DoseUnitCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	DoseUnitCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to DoseUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DoseUnitCode_Insert
(
	
	@DoseUnitCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO DoseUnitCode
			([DoseUnitCodeName] )
	VALUES	(@DoseUnitCodeName )
    

	SELECT  Scope_Identity() AS [DoseUnitCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DoseUnitCode_GetByDoseUnitCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DoseUnitCode_GetByDoseUnitCodeId
GO

-- ==========================================================================================
-- Entity Name:	DoseUnitCode_GetByDoseUnitCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DoseUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DoseUnitCode_GetByDoseUnitCodeId
	(
	@DoseUnitCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DoseUnitCode WHERE [DoseUnitCodeId]=@DoseUnitCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DoseUnitCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DoseUnitCode_Update
GO

-- ==========================================================================================
-- Entity Name:	DoseUnitCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	DoseUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DoseUnitCode_Update
(
	
	@DoseUnitCodeId int,
	@DoseUnitCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE DoseUnitCode SET 

		[DoseUnitCodeName] = @DoseUnitCodeName 
	WHERE [DoseUnitCodeId]=@DoseUnitCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitNote_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitNote_GetALL
GO
-- ==========================================================================================
-- Entity Name:	VisitNote_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitNote_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM VisitNote
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitNote_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitNote_Insert
GO
-- ==========================================================================================
-- Entity Name:	VisitNote_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitNote_Insert
(
	
	@Pid bigint,
	@TenantId int,
	@VisitId bigint,
	@Note nvarchar(max) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	INSERT INTO VisitNote
			([Pid] ,[TenantId] ,[VisitId] ,[Note] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@TenantId ,@VisitId ,@Note ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitNote_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitNote_GetById
GO

-- ==========================================================================================
-- Entity Name:	VisitNote_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitNote_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM VisitNote WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitNote_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitNote_Update
GO

-- ==========================================================================================
-- Entity Name:	VisitNote_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitNote_Update
(
	
	@Id bigint,
	@Pid bigint,
	@TenantId int,
	@VisitId bigint,
	@Note nvarchar(max) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	UPDATE VisitNote SET 

		[Pid] = @Pid ,
		[TenantId] = @TenantId ,
		[VisitId] = @VisitId ,
		[Note] = @Note ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitNote_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitNote_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	VisitNote_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitNote_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM VisitNote WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitNote_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitNote_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	VisitNote_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitNote_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM VisitNote WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitNote_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitNote_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	VisitNote_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from VisitNote table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitNote_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM VisitNote WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	DrugCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from DrugCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM DrugCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	DrugCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to DrugCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugCode_Insert
(
	
	@Id int,
	@Name nvarchar(1000),
	@SideEffect text,
	@DoseUnit nvarchar(25),
	@MinDoseSize real,
	@MaxDoseSize real
)
AS
	SET NOCOUNT ON

	INSERT INTO DrugCode
			([Id] ,[Name] ,[SideEffect] ,[DoseUnit] ,[MinDoseSize] ,[MaxDoseSize] )
	VALUES	(@Id ,@Name ,@SideEffect ,@DoseUnit ,@MinDoseSize ,@MaxDoseSize )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugCode_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugCode_GetById
GO

-- ==========================================================================================
-- Entity Name:	DrugCode_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DrugCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugCode_GetById
	(
	@Id int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DrugCode WHERE [Id]=@Id
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugCode_Update
GO

-- ==========================================================================================
-- Entity Name:	DrugCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	DrugCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugCode_Update
(
	
	@Id int,
	@Name nvarchar(1000),
	@SideEffect text,
	@DoseUnit nvarchar(25),
	@MinDoseSize real,
	@MaxDoseSize real
)
AS
	SET NOCOUNT ON

	UPDATE DrugCode SET 

		[Id] = @Id ,
		[Name] = @Name ,
		[SideEffect] = @SideEffect ,
		[DoseUnit] = @DoseUnit ,
		[MinDoseSize] = @MinDoseSize ,
		[MaxDoseSize] = @MaxDoseSize 
	WHERE [Id]=@Id
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitStatusCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitStatusCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	VisitStatusCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from VisitStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitStatusCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM VisitStatusCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitStatusCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitStatusCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	VisitStatusCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to VisitStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitStatusCode_Insert
(
	
	@VisitStatusCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO VisitStatusCode
			([VisitStatusCodeName] )
	VALUES	(@VisitStatusCodeName )
    

	SELECT  Scope_Identity() AS [VisitStatusCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitStatusCode_GetByVisitStatusCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitStatusCode_GetByVisitStatusCodeId
GO

-- ==========================================================================================
-- Entity Name:	VisitStatusCode_GetByVisitStatusCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from VisitStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitStatusCode_GetByVisitStatusCodeId
	(
	@VisitStatusCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM VisitStatusCode WHERE [VisitStatusCodeId]=@VisitStatusCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].VisitStatusCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].VisitStatusCode_Update
GO

-- ==========================================================================================
-- Entity Name:	VisitStatusCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	VisitStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].VisitStatusCode_Update
(
	
	@VisitStatusCodeId int,
	@VisitStatusCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE VisitStatusCode SET 

		[VisitStatusCodeName] = @VisitStatusCodeName 
	WHERE [VisitStatusCodeId]=@VisitStatusCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugFormCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugFormCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	DrugFormCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from DrugFormCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugFormCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM DrugFormCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugFormCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugFormCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	DrugFormCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to DrugFormCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugFormCode_Insert
(
	
	@DrugFormCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO DrugFormCode
			([DrugFormCodeName] )
	VALUES	(@DrugFormCodeName )
    

	SELECT  Scope_Identity() AS [DrugFormCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugFormCode_GetByDrugFormCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugFormCode_GetByDrugFormCodeId
GO

-- ==========================================================================================
-- Entity Name:	DrugFormCode_GetByDrugFormCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DrugFormCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugFormCode_GetByDrugFormCodeId
	(
	@DrugFormCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DrugFormCode WHERE [DrugFormCodeId]=@DrugFormCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugFormCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugFormCode_Update
GO

-- ==========================================================================================
-- Entity Name:	DrugFormCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	DrugFormCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugFormCode_Update
(
	
	@DrugFormCodeId int,
	@DrugFormCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE DrugFormCode SET 

		[DrugFormCodeName] = @DrugFormCodeName 
	WHERE [DrugFormCodeId]=@DrugFormCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJob_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJob_GetALL
GO
-- ==========================================================================================
-- Entity Name:	WebJob_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from WebJob table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJob_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM WebJob
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJob_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJob_Insert
GO
-- ==========================================================================================
-- Entity Name:	WebJob_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to WebJob table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJob_Insert
(
	
	@JobId smallint,
	@JobName varchar(100),
	@Permissions varchar(150)
)
AS
	SET NOCOUNT ON

	INSERT INTO WebJob
			([JobId] ,[JobName] ,[Permissions] )
	VALUES	(@JobId ,@JobName ,@Permissions )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJob_GetByJobId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJob_GetByJobId
GO

-- ==========================================================================================
-- Entity Name:	WebJob_GetByJobId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from WebJob table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJob_GetByJobId
	(
	@JobId smallint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM WebJob WHERE [JobId]=@JobId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJob_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJob_Update
GO

-- ==========================================================================================
-- Entity Name:	WebJob_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	WebJob table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJob_Update
(
	
	@JobId smallint,
	@JobName varchar(100),
	@Permissions varchar(150)
)
AS
	SET NOCOUNT ON

	UPDATE WebJob SET 

		[JobId] = @JobId ,
		[JobName] = @JobName ,
		[Permissions] = @Permissions 
	WHERE [JobId]=@JobId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugRouteCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugRouteCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	DrugRouteCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from DrugRouteCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugRouteCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM DrugRouteCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugRouteCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugRouteCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	DrugRouteCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to DrugRouteCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugRouteCode_Insert
(
	
	@DrugRouteCodeId int,
	@DrugRouteCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	INSERT INTO DrugRouteCode
			([DrugRouteCodeId] ,[DrugRouteCodeName] )
	VALUES	(@DrugRouteCodeId ,@DrugRouteCodeName )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugRouteCode_GetByDrugRouteCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugRouteCode_GetByDrugRouteCodeId
GO

-- ==========================================================================================
-- Entity Name:	DrugRouteCode_GetByDrugRouteCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from DrugRouteCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugRouteCode_GetByDrugRouteCodeId
	(
	@DrugRouteCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM DrugRouteCode WHERE [DrugRouteCodeId]=@DrugRouteCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].DrugRouteCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].DrugRouteCode_Update
GO

-- ==========================================================================================
-- Entity Name:	DrugRouteCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	DrugRouteCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].DrugRouteCode_Update
(
	
	@DrugRouteCodeId int,
	@DrugRouteCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	UPDATE DrugRouteCode SET 

		[DrugRouteCodeId] = @DrugRouteCodeId ,
		[DrugRouteCodeName] = @DrugRouteCodeName 
	WHERE [DrugRouteCodeId]=@DrugRouteCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJobHistory_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJobHistory_GetALL
GO
-- ==========================================================================================
-- Entity Name:	WebJobHistory_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from WebJobHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJobHistory_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM WebJobHistory
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJobHistory_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJobHistory_Insert
GO
-- ==========================================================================================
-- Entity Name:	WebJobHistory_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to WebJobHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJobHistory_Insert
(
	
	@JobId smallint,
	@CreationTime datetime
)
AS
	SET NOCOUNT ON

	INSERT INTO WebJobHistory
			([JobId] ,[CreationTime] )
	VALUES	(@JobId ,@CreationTime )
    

	SELECT  Scope_Identity() AS [RunId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJobHistory_GetByRunId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJobHistory_GetByRunId
GO

-- ==========================================================================================
-- Entity Name:	WebJobHistory_GetByRunId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from WebJobHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJobHistory_GetByRunId
	(
	@RunId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM WebJobHistory WHERE [RunId]=@RunId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].WebJobHistory_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WebJobHistory_Update
GO

-- ==========================================================================================
-- Entity Name:	WebJobHistory_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	WebJobHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].WebJobHistory_Update
(
	
	@JobId smallint,
	@RunId int,
	@CreationTime datetime
)
AS
	SET NOCOUNT ON

	UPDATE WebJobHistory SET 

		[JobId] = @JobId ,
		[CreationTime] = @CreationTime 
	WHERE [RunId]=@RunId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_GetALL
GO
-- ==========================================================================================
-- Entity Name:	FamilyHistory_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM FamilyHistory
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_Insert
GO
-- ==========================================================================================
-- Entity Name:	FamilyHistory_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO FamilyHistory
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[RelationshipCodeId] ,[ICDCodeCNId] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@RelationshipCodeId ,@ICDCodeCNId ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_GetById
GO

-- ==========================================================================================
-- Entity Name:	FamilyHistory_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM FamilyHistory WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_Update
GO

-- ==========================================================================================
-- Entity Name:	FamilyHistory_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_Update
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
	SET NOCOUNT ON

	UPDATE FamilyHistory SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[TenantId] = @TenantId ,
		[RelationshipCodeId] = @RelationshipCodeId ,
		[ICDCodeCNId] = @ICDCodeCNId ,
		[Note] = @Note ,
		[StatusCodeId] = @StatusCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	FamilyHistory_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM FamilyHistory WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	FamilyHistory_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM FamilyHistory WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FamilyHistory_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FamilyHistory_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	FamilyHistory_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from FamilyHistory table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FamilyHistory_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM FamilyHistory WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FrequencyCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FrequencyCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	FrequencyCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from FrequencyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FrequencyCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM FrequencyCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FrequencyCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FrequencyCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	FrequencyCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to FrequencyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FrequencyCode_Insert
(
	
	@FrequencyCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO FrequencyCode
			([FrequencyCodeName] )
	VALUES	(@FrequencyCodeName )
    

	SELECT  Scope_Identity() AS [FrequencyCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FrequencyCode_GetByFrequencyCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FrequencyCode_GetByFrequencyCodeId
GO

-- ==========================================================================================
-- Entity Name:	FrequencyCode_GetByFrequencyCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from FrequencyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FrequencyCode_GetByFrequencyCodeId
	(
	@FrequencyCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM FrequencyCode WHERE [FrequencyCodeId]=@FrequencyCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].FrequencyCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].FrequencyCode_Update
GO

-- ==========================================================================================
-- Entity Name:	FrequencyCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	FrequencyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].FrequencyCode_Update
(
	
	@FrequencyCodeId int,
	@FrequencyCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE FrequencyCode SET 

		[FrequencyCodeName] = @FrequencyCodeName 
	WHERE [FrequencyCodeId]=@FrequencyCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodeCN_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodeCN_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ICDCodeCN_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ICDCodeCN table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodeCN_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM ICDCodeCN
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodeCN_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodeCN_Insert
GO
-- ==========================================================================================
-- Entity Name:	ICDCodeCN_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ICDCodeCN table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodeCN_Insert
(
	
	@ICDCodeCNId varchar(7),
	@ICDCodeCNShortName nvarchar(60),
	@ICDCodeCNName nvarchar(max),
	@TenantId int = NULL,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint = NULL,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO ICDCodeCN
			([ICDCodeCNId] ,[ICDCodeCNShortName] ,[ICDCodeCNName] ,[TenantId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@ICDCodeCNId ,@ICDCodeCNShortName ,@ICDCodeCNName ,@TenantId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodeCN_GetByICDCodeCNId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodeCN_GetByICDCodeCNId
GO

-- ==========================================================================================
-- Entity Name:	ICDCodeCN_GetByICDCodeCNId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ICDCodeCN table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodeCN_GetByICDCodeCNId
	(
	@ICDCodeCNId varchar(7)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ICDCodeCN WHERE [ICDCodeCNId]=@ICDCodeCNId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodeCN_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodeCN_Update
GO

-- ==========================================================================================
-- Entity Name:	ICDCodeCN_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ICDCodeCN table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodeCN_Update
(
	
	@ICDCodeCNId varchar(7),
	@ICDCodeCNShortName nvarchar(60),
	@ICDCodeCNName nvarchar(max),
	@TenantId int = NULL,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint = NULL,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	UPDATE ICDCodeCN SET 

		[ICDCodeCNId] = @ICDCodeCNId ,
		[ICDCodeCNShortName] = @ICDCodeCNShortName ,
		[ICDCodeCNName] = @ICDCodeCNName ,
		[TenantId] = @TenantId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [ICDCodeCNId]=@ICDCodeCNId
   AND TenantId = @TenantId
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodeCN_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodeCN_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	ICDCodeCN_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ICDCodeCN table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodeCN_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ICDCodeCN WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodePCS_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodePCS_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ICDCodePCS_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ICDCodePCS table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodePCS_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM ICDCodePCS
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodePCS_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodePCS_Insert
GO
-- ==========================================================================================
-- Entity Name:	ICDCodePCS_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ICDCodePCS table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodePCS_Insert
(
	
	@ICDCodePCSId varchar(7),
	@ICDCodePCSShortName nvarchar(60),
	@ICDCodePCSName nvarchar(max),
	@TenantId int = NULL,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint = NULL,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO ICDCodePCS
			([ICDCodePCSId] ,[ICDCodePCSShortName] ,[ICDCodePCSName] ,[TenantId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@ICDCodePCSId ,@ICDCodePCSShortName ,@ICDCodePCSName ,@TenantId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodePCS_GetByICDCodePCSId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodePCS_GetByICDCodePCSId
GO

-- ==========================================================================================
-- Entity Name:	ICDCodePCS_GetByICDCodePCSId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ICDCodePCS table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodePCS_GetByICDCodePCSId
	(
	@ICDCodePCSId varchar(7)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ICDCodePCS WHERE [ICDCodePCSId]=@ICDCodePCSId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodePCS_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodePCS_Update
GO

-- ==========================================================================================
-- Entity Name:	ICDCodePCS_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ICDCodePCS table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodePCS_Update
(
	
	@ICDCodePCSId varchar(7),
	@ICDCodePCSShortName nvarchar(60),
	@ICDCodePCSName nvarchar(max),
	@TenantId int = NULL,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint = NULL,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	UPDATE ICDCodePCS SET 

		[ICDCodePCSId] = @ICDCodePCSId ,
		[ICDCodePCSShortName] = @ICDCodePCSShortName ,
		[ICDCodePCSName] = @ICDCodePCSName ,
		[TenantId] = @TenantId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [ICDCodePCSId]=@ICDCodePCSId
   AND TenantId = @TenantId
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ICDCodePCS_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ICDCodePCS_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	ICDCodePCS_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ICDCodePCS table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ICDCodePCS_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ICDCodePCS WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ImmunizationCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ImmunizationCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ImmunizationCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ImmunizationCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ImmunizationCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM ImmunizationCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ImmunizationCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ImmunizationCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	ImmunizationCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ImmunizationCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ImmunizationCode_Insert
(
	
	@ImmunizationName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO ImmunizationCode
			([ImmunizationName] )
	VALUES	(@ImmunizationName )
    

	SELECT  Scope_Identity() AS [ImmunizationCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ImmunizationCode_GetByImmunizationCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ImmunizationCode_GetByImmunizationCodeId
GO

-- ==========================================================================================
-- Entity Name:	ImmunizationCode_GetByImmunizationCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ImmunizationCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ImmunizationCode_GetByImmunizationCodeId
	(
	@ImmunizationCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ImmunizationCode WHERE [ImmunizationCodeId]=@ImmunizationCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ImmunizationCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ImmunizationCode_Update
GO

-- ==========================================================================================
-- Entity Name:	ImmunizationCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ImmunizationCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ImmunizationCode_Update
(
	
	@ImmunizationCodeId int,
	@ImmunizationName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE ImmunizationCode SET 

		[ImmunizationName] = @ImmunizationName 
	WHERE [ImmunizationCodeId]=@ImmunizationCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_GetALL
GO
-- ==========================================================================================
-- Entity Name:	Immunizations_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM Immunizations
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_Insert
GO
-- ==========================================================================================
-- Entity Name:	Immunizations_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO Immunizations
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[ImmunizationCodeId] ,[AdministeredDate] ,[AdministeredById] ,[Note] ,[ExpirationDate] ,[CompletionStatusCodeId] ,[Status] ,[InformationSource] ,[AdministrationSiteId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@ImmunizationCodeId ,@AdministeredDate ,@AdministeredById ,@Note ,@ExpirationDate ,@CompletionStatusCodeId ,@Status ,@InformationSource ,@AdministrationSiteId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_GetById
GO

-- ==========================================================================================
-- Entity Name:	Immunizations_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Immunizations WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_Update
GO

-- ==========================================================================================
-- Entity Name:	Immunizations_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_Update
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
	SET NOCOUNT ON

	UPDATE Immunizations SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[TenantId] = @TenantId ,
		[ImmunizationCodeId] = @ImmunizationCodeId ,
		[AdministeredDate] = @AdministeredDate ,
		[AdministeredById] = @AdministeredById ,
		[Note] = @Note ,
		[ExpirationDate] = @ExpirationDate ,
		[CompletionStatusCodeId] = @CompletionStatusCodeId ,
		[Status] = @Status ,
		[InformationSource] = @InformationSource ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	Immunizations_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Immunizations WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	Immunizations_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Immunizations WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Immunizations_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Immunizations_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	Immunizations_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Immunizations table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Immunizations_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Immunizations WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].InformationSource_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].InformationSource_GetALL
GO
-- ==========================================================================================
-- Entity Name:	InformationSource_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from InformationSource table
-- ==========================================================================================
CREATE PROCEDURE [dbo].InformationSource_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM InformationSource
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].InformationSource_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].InformationSource_Insert
GO
-- ==========================================================================================
-- Entity Name:	InformationSource_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to InformationSource table
-- ==========================================================================================
CREATE PROCEDURE [dbo].InformationSource_Insert
(
	
	@InformationSourceName nvarchar(200)
)
AS
	SET NOCOUNT ON

	INSERT INTO InformationSource
			([InformationSourceName] )
	VALUES	(@InformationSourceName )
    

	SELECT  Scope_Identity() AS [InformationSourceId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].InformationSource_GetByInformationSourceId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].InformationSource_GetByInformationSourceId
GO

-- ==========================================================================================
-- Entity Name:	InformationSource_GetByInformationSourceId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from InformationSource table
-- ==========================================================================================
CREATE PROCEDURE [dbo].InformationSource_GetByInformationSourceId
	(
	@InformationSourceId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM InformationSource WHERE [InformationSourceId]=@InformationSourceId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].InformationSource_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].InformationSource_Update
GO

-- ==========================================================================================
-- Entity Name:	InformationSource_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	InformationSource table
-- ==========================================================================================
CREATE PROCEDURE [dbo].InformationSource_Update
(
	
	@InformationSourceId int,
	@InformationSourceName nvarchar(200)
)
AS
	SET NOCOUNT ON

	UPDATE InformationSource SET 

		[InformationSourceName] = @InformationSourceName 
	WHERE [InformationSourceId]=@InformationSourceId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_GetALL
GO
-- ==========================================================================================
-- Entity Name:	LifeStyle_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM LifeStyle
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_Insert
GO
-- ==========================================================================================
-- Entity Name:	LifeStyle_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO LifeStyle
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[LifeStyleTypeId] ,[QuitDate] ,[CurrentlyActive] ,[Note] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@LifeStyleTypeId ,@QuitDate ,@CurrentlyActive ,@Note ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_GetById
GO

-- ==========================================================================================
-- Entity Name:	LifeStyle_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LifeStyle WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_Update
GO

-- ==========================================================================================
-- Entity Name:	LifeStyle_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_Update
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
	SET NOCOUNT ON

	UPDATE LifeStyle SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[TenantId] = @TenantId ,
		[LifeStyleTypeId] = @LifeStyleTypeId ,
		[QuitDate] = @QuitDate ,
		[CurrentlyActive] = @CurrentlyActive ,
		[Note] = @Note ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	LifeStyle_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LifeStyle WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	LifeStyle_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LifeStyle WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyle_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyle_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	LifeStyle_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LifeStyle table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyle_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LifeStyle WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyleType_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyleType_GetALL
GO
-- ==========================================================================================
-- Entity Name:	LifeStyleType_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from LifeStyleType table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyleType_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM LifeStyleType
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyleType_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyleType_Insert
GO
-- ==========================================================================================
-- Entity Name:	LifeStyleType_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to LifeStyleType table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyleType_Insert
(
	
	@LifeStyleTypeName nvarchar(200)
)
AS
	SET NOCOUNT ON

	INSERT INTO LifeStyleType
			([LifeStyleTypeName] )
	VALUES	(@LifeStyleTypeName )
    

	SELECT  Scope_Identity() AS [LifeStyleTypeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyleType_GetByLifeStyleTypeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyleType_GetByLifeStyleTypeId
GO

-- ==========================================================================================
-- Entity Name:	LifeStyleType_GetByLifeStyleTypeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LifeStyleType table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyleType_GetByLifeStyleTypeId
	(
	@LifeStyleTypeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LifeStyleType WHERE [LifeStyleTypeId]=@LifeStyleTypeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LifeStyleType_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LifeStyleType_Update
GO

-- ==========================================================================================
-- Entity Name:	LifeStyleType_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	LifeStyleType table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LifeStyleType_Update
(
	
	@LifeStyleTypeId int,
	@LifeStyleTypeName nvarchar(200)
)
AS
	SET NOCOUNT ON

	UPDATE LifeStyleType SET 

		[LifeStyleTypeName] = @LifeStyleTypeName 
	WHERE [LifeStyleTypeId]=@LifeStyleTypeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	LoincCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from LoincCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincCode_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincCode
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	LoincCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to LoincCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincCode_Insert
(
	
	@LoincCodeId varchar(10),
	@Component varchar(255) = NULL,
	@Property varchar(30) = NULL,
	@TimeAspct varchar(15) = NULL,
	@SystemCode varchar(100) = NULL,
	@ScaleType varchar(30) = NULL,
	@MethodType varchar(50) = NULL,
	@ClassName varchar(20) = NULL,
	@Formula text = NULL,
	@UnitsRequired varchar(1) = NULL,
	@SubmittedUnits varchar(35) = NULL,
	@RelatedNames text = NULL,
	@ShortName varchar(45) = NULL,
	@ExampleUnits varchar(255) = NULL,
	@LongCommonName varchar(255) = NULL,
	@UnitsAndRange varchar(255) = NULL,
	@ExampleUcumUnits varchar(255) = NULL,
	@TenantId int = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO LoincCode
			([LoincCodeId] ,[Component] ,[Property] ,[TimeAspct] ,[SystemCode] ,[ScaleType] ,[MethodType] ,[ClassName] ,[Formula] ,[UnitsRequired] ,[SubmittedUnits] ,[RelatedNames] ,[ShortName] ,[ExampleUnits] ,[LongCommonName] ,[UnitsAndRange] ,[ExampleUcumUnits] ,[TenantId] )
	VALUES	(@LoincCodeId ,@Component ,@Property ,@TimeAspct ,@SystemCode ,@ScaleType ,@MethodType ,@ClassName ,@Formula ,@UnitsRequired ,@SubmittedUnits ,@RelatedNames ,@ShortName ,@ExampleUnits ,@LongCommonName ,@UnitsAndRange ,@ExampleUcumUnits ,@TenantId )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincCode_GetByLoincCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincCode_GetByLoincCodeId
GO

-- ==========================================================================================
-- Entity Name:	LoincCode_GetByLoincCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincCode_GetByLoincCodeId
	(
	@LoincCodeId varchar(10)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincCode WHERE [LoincCodeId]=@LoincCodeId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincCode_Update
GO

-- ==========================================================================================
-- Entity Name:	LoincCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	LoincCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincCode_Update
(
	
	@LoincCodeId varchar(10),
	@Component varchar(255) = NULL,
	@Property varchar(30) = NULL,
	@TimeAspct varchar(15) = NULL,
	@SystemCode varchar(100) = NULL,
	@ScaleType varchar(30) = NULL,
	@MethodType varchar(50) = NULL,
	@ClassName varchar(20) = NULL,
	@Formula text = NULL,
	@UnitsRequired varchar(1) = NULL,
	@SubmittedUnits varchar(35) = NULL,
	@RelatedNames text = NULL,
	@ShortName varchar(45) = NULL,
	@ExampleUnits varchar(255) = NULL,
	@LongCommonName varchar(255) = NULL,
	@UnitsAndRange varchar(255) = NULL,
	@ExampleUcumUnits varchar(255) = NULL,
	@TenantId int = NULL
)
AS
	SET NOCOUNT ON

	UPDATE LoincCode SET 

		[LoincCodeId] = @LoincCodeId ,
		[Component] = @Component ,
		[Property] = @Property ,
		[TimeAspct] = @TimeAspct ,
		[SystemCode] = @SystemCode ,
		[ScaleType] = @ScaleType ,
		[MethodType] = @MethodType ,
		[ClassName] = @ClassName ,
		[Formula] = @Formula ,
		[UnitsRequired] = @UnitsRequired ,
		[SubmittedUnits] = @SubmittedUnits ,
		[RelatedNames] = @RelatedNames ,
		[ShortName] = @ShortName ,
		[ExampleUnits] = @ExampleUnits ,
		[LongCommonName] = @LongCommonName ,
		[UnitsAndRange] = @UnitsAndRange ,
		[ExampleUcumUnits] = @ExampleUcumUnits ,
		[TenantId] = @TenantId 
	WHERE [LoincCodeId]=@LoincCodeId
   AND TenantId = @TenantId
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincPanelCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincPanelCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	LoincPanelCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from LoincPanelCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincPanelCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM LoincPanelCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincPanelCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincPanelCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	LoincPanelCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to LoincPanelCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincPanelCode_Insert
(
	
	@ParentId int,
	@ParentLoincCodeId varchar(10),
	@ParentName varchar(255) = NULL,
	@Id int,
	@Sequence int,
	@LoincCodeId varchar(10),
	@Name varchar(255) = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO LoincPanelCode
			([ParentId] ,[ParentLoincCodeId] ,[ParentName] ,[Id] ,[Sequence] ,[LoincCodeId] ,[Name] )
	VALUES	(@ParentId ,@ParentLoincCodeId ,@ParentName ,@Id ,@Sequence ,@LoincCodeId ,@Name )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincPanelCode_GetByParentId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincPanelCode_GetByParentId
GO

-- ==========================================================================================
-- Entity Name:	LoincPanelCode_GetByParentId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincPanelCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincPanelCode_GetByParentId
	(
	@ParentId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincPanelCode WHERE [ParentId]=@ParentId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincPanelCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincPanelCode_Update
GO

-- ==========================================================================================
-- Entity Name:	LoincPanelCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	LoincPanelCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincPanelCode_Update
(
	
	@ParentId int,
	@ParentLoincCodeId varchar(10),
	@ParentName varchar(255) = NULL,
	@Id int,
	@Sequence int,
	@LoincCodeId varchar(10),
	@Name varchar(255) = NULL
)
AS
	SET NOCOUNT ON

	UPDATE LoincPanelCode SET 

		[ParentId] = @ParentId ,
		[ParentLoincCodeId] = @ParentLoincCodeId ,
		[ParentName] = @ParentName ,
		[Id] = @Id ,
		[Sequence] = @Sequence ,
		[LoincCodeId] = @LoincCodeId ,
		[Name] = @Name 
	WHERE [ParentId]=@ParentId
   
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincPanelCode_GetByParentLoincCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincPanelCode_GetByParentLoincCodeId
GO

-- ==========================================================================================
-- Entity Name:	LoincPanelCode_GetByParentLoincCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincPanelCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincPanelCode_GetByParentLoincCodeId
	(
	@ParentLoincCodeId varchar(10)
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincPanelCode WHERE [ParentLoincCodeId]=@ParentLoincCodeId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincPanelCode_GetByLoincCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincPanelCode_GetByLoincCodeId
GO

-- ==========================================================================================
-- Entity Name:	LoincPanelCode_GetByLoincCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincPanelCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincPanelCode_GetByLoincCodeId
	(
	@LoincCodeId varchar(10)
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincPanelCode WHERE [LoincCodeId]=@LoincCodeId   
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincRangeCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincRangeCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	LoincRangeCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from LoincRangeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincRangeCode_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincRangeCode
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincRangeCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincRangeCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	LoincRangeCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to LoincRangeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincRangeCode_Insert
(
	
	@LoincCodeId varchar(10),
	@LoincRangeCodeName varchar(30),
	@TenantId int
)
AS
	SET NOCOUNT ON

	INSERT INTO LoincRangeCode
			([LoincCodeId] ,[LoincRangeCodeName] ,[TenantId] )
	VALUES	(@LoincCodeId ,@LoincRangeCodeName ,@TenantId )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincRangeCode_GetByLoincCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincRangeCode_GetByLoincCodeId
GO

-- ==========================================================================================
-- Entity Name:	LoincRangeCode_GetByLoincCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincRangeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincRangeCode_GetByLoincCodeId
	(
	@LoincCodeId varchar(10)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincRangeCode WHERE [LoincCodeId]=@LoincCodeId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincRangeCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincRangeCode_Update
GO

-- ==========================================================================================
-- Entity Name:	LoincRangeCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	LoincRangeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincRangeCode_Update
(
	
	@LoincCodeId varchar(10),
	@LoincRangeCodeName varchar(30),
	@TenantId int
)
AS
	SET NOCOUNT ON

	UPDATE LoincRangeCode SET 

		[LoincCodeId] = @LoincCodeId ,
		[LoincRangeCodeName] = @LoincRangeCodeName ,
		[TenantId] = @TenantId 
	WHERE [LoincCodeId]=@LoincCodeId
   AND TenantId = @TenantId
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincUnitCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincUnitCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	LoincUnitCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from LoincUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincUnitCode_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincUnitCode
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincUnitCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincUnitCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	LoincUnitCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to LoincUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincUnitCode_Insert
(
	
	@LoincCodeId varchar(10),
	@LoincUnitCodeName varchar(30),
	@TenantId int
)
AS
	SET NOCOUNT ON

	INSERT INTO LoincUnitCode
			([LoincCodeId] ,[LoincUnitCodeName] ,[TenantId] )
	VALUES	(@LoincCodeId ,@LoincUnitCodeName ,@TenantId )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincUnitCode_GetByLoincCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincUnitCode_GetByLoincCodeId
GO

-- ==========================================================================================
-- Entity Name:	LoincUnitCode_GetByLoincCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from LoincUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincUnitCode_GetByLoincCodeId
	(
	@LoincCodeId varchar(10)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM LoincUnitCode WHERE [LoincCodeId]=@LoincCodeId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].LoincUnitCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].LoincUnitCode_Update
GO

-- ==========================================================================================
-- Entity Name:	LoincUnitCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	LoincUnitCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].LoincUnitCode_Update
(
	
	@LoincCodeId varchar(10),
	@LoincUnitCodeName varchar(30),
	@TenantId int
)
AS
	SET NOCOUNT ON

	UPDATE LoincUnitCode SET 

		[LoincCodeId] = @LoincCodeId ,
		[LoincUnitCodeName] = @LoincUnitCodeName ,
		[TenantId] = @TenantId 
	WHERE [LoincCodeId]=@LoincCodeId
   AND TenantId = @TenantId
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderCondition_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderCondition_GetALL
GO
-- ==========================================================================================
-- Entity Name:	OrderCondition_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from OrderCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderCondition_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM OrderCondition
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderCondition_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderCondition_Insert
GO
-- ==========================================================================================
-- Entity Name:	OrderCondition_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to OrderCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderCondition_Insert
(
	
	@OrderId bigint,
	@ICDCodeCNId varchar(7),
	@PrimaryCondition bit
)
AS
	SET NOCOUNT ON

	INSERT INTO OrderCondition
			([OrderId] ,[ICDCodeCNId] ,[PrimaryCondition] )
	VALUES	(@OrderId ,@ICDCodeCNId ,@PrimaryCondition )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderCondition_GetByOrderId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderCondition_GetByOrderId
GO

-- ==========================================================================================
-- Entity Name:	OrderCondition_GetByOrderId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from OrderCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderCondition_GetByOrderId
	(
	@OrderId bigint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM OrderCondition WHERE [OrderId]=@OrderId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderCondition_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderCondition_Update
GO

-- ==========================================================================================
-- Entity Name:	OrderCondition_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	OrderCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderCondition_Update
(
	
	@OrderId bigint,
	@ICDCodeCNId varchar(7),
	@PrimaryCondition bit
)
AS
	SET NOCOUNT ON

	UPDATE OrderCondition SET 

		[OrderId] = @OrderId ,
		[ICDCodeCNId] = @ICDCodeCNId ,
		[PrimaryCondition] = @PrimaryCondition 
	WHERE [OrderId]=@OrderId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].UserPreference_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].UserPreference_GetALL
GO
-- ==========================================================================================
-- Entity Name:	UserPreference_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from UserPreference table
-- ==========================================================================================
CREATE PROCEDURE [dbo].UserPreference_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM UserPreference
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].UserPreference_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].UserPreference_Insert
GO
-- ==========================================================================================
-- Entity Name:	UserPreference_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to UserPreference table
-- ==========================================================================================
CREATE PROCEDURE [dbo].UserPreference_Insert
(
	
	@Id bigint,
	@TenantId int,
	@AdministrationSiteId int = NULL,
	@CalendarColor nvarchar(7) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	INSERT INTO UserPreference
			([Id] ,[TenantId] ,[AdministrationSiteId] ,[CalendarColor] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Id ,@TenantId ,@AdministrationSiteId ,@CalendarColor ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].UserPreference_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].UserPreference_GetById
GO

-- ==========================================================================================
-- Entity Name:	UserPreference_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from UserPreference table
-- ==========================================================================================
CREATE PROCEDURE [dbo].UserPreference_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM UserPreference WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].UserPreference_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].UserPreference_Update
GO

-- ==========================================================================================
-- Entity Name:	UserPreference_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	UserPreference table
-- ==========================================================================================
CREATE PROCEDURE [dbo].UserPreference_Update
(
	
	@Id bigint,
	@TenantId int,
	@AdministrationSiteId int = NULL,
	@CalendarColor nvarchar(7) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	UPDATE UserPreference SET 

		[Id] = @Id ,
		[TenantId] = @TenantId ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[CalendarColor] = @CalendarColor ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].UserPreference_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].UserPreference_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	UserPreference_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from UserPreference table
-- ==========================================================================================
CREATE PROCEDURE [dbo].UserPreference_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM UserPreference WHERE [TenantId]=@TenantId   
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderResult_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderResult_GetALL
GO
-- ==========================================================================================
-- Entity Name:	OrderResult_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from OrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderResult_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM OrderResult
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderResult_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderResult_Insert
GO
-- ==========================================================================================
-- Entity Name:	OrderResult_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to OrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderResult_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO OrderResult
			([OrderId] ,[Pid] ,[TenantId] ,[ResultDate] ,[Archived] ,[ParentId] ,[ResultById] ,[ParentLoincCodeId] ,[LoincCodeId] ,[ResultDataCodeId] ,[ResultData] ,[AdministrationSiteId] ,[Unit] ,[RangeValue] ,[AbnormalCodeId] ,[Note] ,[ResultStatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@OrderId ,@Pid ,@TenantId ,@ResultDate ,@Archived ,@ParentId ,@ResultById ,@ParentLoincCodeId ,@LoincCodeId ,@ResultDataCodeId ,@ResultData ,@AdministrationSiteId ,@Unit ,@RangeValue ,@AbnormalCodeId ,@Note ,@ResultStatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderResult_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderResult_GetById
GO

-- ==========================================================================================
-- Entity Name:	OrderResult_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from OrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderResult_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM OrderResult WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderResult_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderResult_Update
GO

-- ==========================================================================================
-- Entity Name:	OrderResult_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	OrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderResult_Update
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
	SET NOCOUNT ON

	UPDATE OrderResult SET 

		[OrderId] = @OrderId ,
		[Pid] = @Pid ,
		[TenantId] = @TenantId ,
		[ResultDate] = @ResultDate ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[ResultById] = @ResultById ,
		[ParentLoincCodeId] = @ParentLoincCodeId ,
		[LoincCodeId] = @LoincCodeId ,
		[ResultDataCodeId] = @ResultDataCodeId ,
		[ResultData] = @ResultData ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[Unit] = @Unit ,
		[RangeValue] = @RangeValue ,
		[AbnormalCodeId] = @AbnormalCodeId ,
		[Note] = @Note ,
		[ResultStatusCodeId] = @ResultStatusCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderResult_GetByOrderId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderResult_GetByOrderId
GO

-- ==========================================================================================
-- Entity Name:	OrderResult_GetByOrderId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from OrderResult table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderResult_GetByOrderId
	(
	@OrderId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM OrderResult WHERE [OrderId]=@OrderId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Appointment_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Appointment_GetALL
GO
-- ==========================================================================================
-- Entity Name:	Appointment_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from Appointment table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Appointment_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM Appointment
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Appointment_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Appointment_Insert
GO
-- ==========================================================================================
-- Entity Name:	Appointment_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to Appointment table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Appointment_Insert
(
	
	@Pid int = NULL,
	@TenantId int,
	@ProviderId int,
	@AppointmentCodeId int,
	@AppointmentStatusCodeId int,
	@AllDayEvent bit,
	@StartDate datetime2,
	@EndDate datetime2,
	@Title nvarchar(255),
	@AdministrationSiteId int = NULL,
	@Fname nvarchar(50) = NULL,
	@Lname nvarchar(50) = NULL,
	@Mname nvarchar(50) = NULL,
	@DOB date = NULL,
	@PhoneCell nvarchar(20) = NULL,
	@PhoneHome nvarchar(20) = NULL,
	@Note nvarchar(max) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	INSERT INTO Appointment
			([Pid] ,[TenantId] ,[ProviderId] ,[AppointmentCodeId] ,[AppointmentStatusCodeId] ,[AllDayEvent] ,[StartDate] ,[EndDate] ,[Title] ,[AdministrationSiteId] ,[Fname] ,[Lname] ,[Mname] ,[DOB] ,[PhoneCell] ,[PhoneHome] ,[Note] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@TenantId ,@ProviderId ,@AppointmentCodeId ,@AppointmentStatusCodeId ,@AllDayEvent ,@StartDate ,@EndDate ,@Title ,@AdministrationSiteId ,@Fname ,@Lname ,@Mname ,@DOB ,@PhoneCell ,@PhoneHome ,@Note ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Appointment_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Appointment_GetById
GO

-- ==========================================================================================
-- Entity Name:	Appointment_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Appointment table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Appointment_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Appointment WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Appointment_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Appointment_Update
GO

-- ==========================================================================================
-- Entity Name:	Appointment_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	Appointment table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Appointment_Update
(
	
	@Id bigint,
	@Pid int = NULL,
	@TenantId int,
	@ProviderId int,
	@AppointmentCodeId int,
	@AppointmentStatusCodeId int,
	@AllDayEvent bit,
	@StartDate datetime2,
	@EndDate datetime2,
	@Title nvarchar(255),
	@AdministrationSiteId int = NULL,
	@Fname nvarchar(50) = NULL,
	@Lname nvarchar(50) = NULL,
	@Mname nvarchar(50) = NULL,
	@DOB date = NULL,
	@PhoneCell nvarchar(20) = NULL,
	@PhoneHome nvarchar(20) = NULL,
	@Note nvarchar(max) = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	UPDATE Appointment SET 

		[Pid] = @Pid ,
		[TenantId] = @TenantId ,
		[ProviderId] = @ProviderId ,
		[AppointmentCodeId] = @AppointmentCodeId ,
		[AppointmentStatusCodeId] = @AppointmentStatusCodeId ,
		[AllDayEvent] = @AllDayEvent ,
		[StartDate] = @StartDate ,
		[EndDate] = @EndDate ,
		[Title] = @Title ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[Fname] = @Fname ,
		[Lname] = @Lname ,
		[Mname] = @Mname ,
		[DOB] = @DOB ,
		[PhoneCell] = @PhoneCell ,
		[PhoneHome] = @PhoneHome ,
		[Note] = @Note ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Appointment_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Appointment_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	Appointment_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Appointment table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Appointment_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Appointment WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Appointment_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Appointment_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	Appointment_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Appointment table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Appointment_GetByPid
	(
	@Pid int
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Appointment WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Appointment_GetByProviderId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Appointment_GetByProviderId
GO

-- ==========================================================================================
-- Entity Name:	Appointment_GetByProviderId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Appointment table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Appointment_GetByProviderId
	(
	@ProviderId int
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Appointment WHERE [ProviderId]=@ProviderId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AppointmentCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AppointmentCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AppointmentCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AppointmentCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AppointmentCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentCode_Insert
(
	
	@AppointmentCodeId int,
	@AppointmentCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	INSERT INTO AppointmentCode
			([AppointmentCodeId] ,[AppointmentCodeName] )
	VALUES	(@AppointmentCodeId ,@AppointmentCodeName )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentCode_GetByAppointmentCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentCode_GetByAppointmentCodeId
GO

-- ==========================================================================================
-- Entity Name:	AppointmentCode_GetByAppointmentCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AppointmentCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentCode_GetByAppointmentCodeId
	(
	@AppointmentCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AppointmentCode WHERE [AppointmentCodeId]=@AppointmentCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AppointmentCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AppointmentCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentCode_Update
(
	
	@AppointmentCodeId int,
	@AppointmentCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	UPDATE AppointmentCode SET 

		[AppointmentCodeId] = @AppointmentCodeId ,
		[AppointmentCodeName] = @AppointmentCodeName 
	WHERE [AppointmentCodeId]=@AppointmentCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentStatusCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentStatusCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AppointmentStatusCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AppointmentStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentStatusCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AppointmentStatusCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentStatusCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentStatusCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AppointmentStatusCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AppointmentStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentStatusCode_Insert
(
	
	@AppointmentStatusCodeId int,
	@AppointmentStatusCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	INSERT INTO AppointmentStatusCode
			([AppointmentStatusCodeId] ,[AppointmentStatusCodeName] )
	VALUES	(@AppointmentStatusCodeId ,@AppointmentStatusCodeName )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentStatusCode_GetByAppointmentStatusCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentStatusCode_GetByAppointmentStatusCodeId
GO

-- ==========================================================================================
-- Entity Name:	AppointmentStatusCode_GetByAppointmentStatusCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AppointmentStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentStatusCode_GetByAppointmentStatusCodeId
	(
	@AppointmentStatusCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AppointmentStatusCode WHERE [AppointmentStatusCodeId]=@AppointmentStatusCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AppointmentStatusCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AppointmentStatusCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AppointmentStatusCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AppointmentStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AppointmentStatusCode_Update
(
	
	@AppointmentStatusCodeId int,
	@AppointmentStatusCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	UPDATE AppointmentStatusCode SET 

		[AppointmentStatusCodeId] = @AppointmentStatusCodeId ,
		[AppointmentStatusCodeName] = @AppointmentStatusCodeName 
	WHERE [AppointmentStatusCodeId]=@AppointmentStatusCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientVital_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientVital_GetALL
GO
-- ==========================================================================================
-- Entity Name:	PatientVital_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientVital_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientVital
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientVital_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientVital_Insert
GO
-- ==========================================================================================
-- Entity Name:	PatientVital_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientVital_Insert
(
	
	@VisitId bigint,
	@TenantId int,
	@CreateDate datetime2,
	@CreatedBy bigint,
	@Pid bigint,
	@Bps numeric(5,2) = NULL,
	@Bpd numeric(5,2) = NULL,
	@Weight numeric(5,2) = NULL,
	@Height numeric(5,2) = NULL,
	@Temperature numeric(5,2) = NULL,
	@TempMethod nvarchar(255) = NULL,
	@Pulse numeric(5,2) = NULL,
	@Respiration numeric(5,2) = NULL,
	@BMI numeric(4,1) = NULL,
	@BMIStatus nvarchar(255) = NULL,
	@WaistCirc numeric(5,2) = NULL,
	@HeadCirc numeric(4,2) = NULL,
	@OxygenSaturation numeric(5,2) = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO PatientVital
			([VisitId] ,[TenantId] ,[CreateDate] ,[CreatedBy] ,[Pid] ,[Bps] ,[Bpd] ,[Weight] ,[Height] ,[Temperature] ,[TempMethod] ,[Pulse] ,[Respiration] ,[BMI] ,[BMIStatus] ,[WaistCirc] ,[HeadCirc] ,[OxygenSaturation] )
	VALUES	(@VisitId ,@TenantId ,@CreateDate ,@CreatedBy ,@Pid ,@Bps ,@Bpd ,@Weight ,@Height ,@Temperature ,@TempMethod ,@Pulse ,@Respiration ,@BMI ,@BMIStatus ,@WaistCirc ,@HeadCirc ,@OxygenSaturation )
    

	SELECT  Scope_Identity() AS [VitalId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientVital_GetByVitalId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientVital_GetByVitalId
GO

-- ==========================================================================================
-- Entity Name:	PatientVital_GetByVitalId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientVital_GetByVitalId
	(
	@VitalId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientVital WHERE [VitalId]=@VitalId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientVital_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientVital_Update
GO

-- ==========================================================================================
-- Entity Name:	PatientVital_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientVital_Update
(
	
	@VitalId bigint,
	@VisitId bigint,
	@TenantId int,
	@CreateDate datetime2,
	@CreatedBy bigint,
	@Pid bigint,
	@Bps numeric(5,2) = NULL,
	@Bpd numeric(5,2) = NULL,
	@Weight numeric(5,2) = NULL,
	@Height numeric(5,2) = NULL,
	@Temperature numeric(5,2) = NULL,
	@TempMethod nvarchar(255) = NULL,
	@Pulse numeric(5,2) = NULL,
	@Respiration numeric(5,2) = NULL,
	@BMI numeric(4,1) = NULL,
	@BMIStatus nvarchar(255) = NULL,
	@WaistCirc numeric(5,2) = NULL,
	@HeadCirc numeric(4,2) = NULL,
	@OxygenSaturation numeric(5,2) = NULL
)
AS
	SET NOCOUNT ON

	UPDATE PatientVital SET 

		[VisitId] = @VisitId ,
		[TenantId] = @TenantId ,
		[CreateDate] = @CreateDate ,
		[CreatedBy] = @CreatedBy ,
		[Pid] = @Pid ,
		[Bps] = @Bps ,
		[Bpd] = @Bpd ,
		[Weight] = @Weight ,
		[Height] = @Height ,
		[Temperature] = @Temperature ,
		[TempMethod] = @TempMethod ,
		[Pulse] = @Pulse ,
		[Respiration] = @Respiration ,
		[BMI] = @BMI ,
		[BMIStatus] = @BMIStatus ,
		[WaistCirc] = @WaistCirc ,
		[HeadCirc] = @HeadCirc ,
		[OxygenSaturation] = @OxygenSaturation 
	WHERE [VitalId]=@VitalId
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientVital_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientVital_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	PatientVital_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientVital_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientVital WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientVital_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientVital_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	PatientVital_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientVital_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientVital WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientVital_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientVital_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	PatientVital_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientVital table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientVital_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientVital WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderSpecimen_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderSpecimen_GetALL
GO
-- ==========================================================================================
-- Entity Name:	OrderSpecimen_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from OrderSpecimen table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderSpecimen_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM OrderSpecimen
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderSpecimen_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderSpecimen_Insert
GO
-- ==========================================================================================
-- Entity Name:	OrderSpecimen_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to OrderSpecimen table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderSpecimen_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO OrderSpecimen
			([OrderId] ,[Pid] ,[TenantId] ,[Archived] ,[ParentId] ,[CollectedDate] ,[CollectedById] ,[Note] ,[StatusCodeId] ,[AdministrationSiteId] ,[SpecimenNumber] ,[SpecimenCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@OrderId ,@Pid ,@TenantId ,@Archived ,@ParentId ,@CollectedDate ,@CollectedById ,@Note ,@StatusCodeId ,@AdministrationSiteId ,@SpecimenNumber ,@SpecimenCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderSpecimen_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderSpecimen_GetById
GO

-- ==========================================================================================
-- Entity Name:	OrderSpecimen_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from OrderSpecimen table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderSpecimen_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM OrderSpecimen WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderSpecimen_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderSpecimen_Update
GO

-- ==========================================================================================
-- Entity Name:	OrderSpecimen_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	OrderSpecimen table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderSpecimen_Update
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
	SET NOCOUNT ON

	UPDATE OrderSpecimen SET 

		[OrderId] = @OrderId ,
		[Pid] = @Pid ,
		[TenantId] = @TenantId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[CollectedDate] = @CollectedDate ,
		[CollectedById] = @CollectedById ,
		[Note] = @Note ,
		[StatusCodeId] = @StatusCodeId ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[SpecimenNumber] = @SpecimenNumber ,
		[SpecimenCodeId] = @SpecimenCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OrderSpecimen_GetByOrderId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OrderSpecimen_GetByOrderId
GO

-- ==========================================================================================
-- Entity Name:	OrderSpecimen_GetByOrderId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from OrderSpecimen table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OrderSpecimen_GetByOrderId
	(
	@OrderId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM OrderSpecimen WHERE [OrderId]=@OrderId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OutcomeCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OutcomeCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	OutcomeCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from OutcomeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OutcomeCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM OutcomeCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OutcomeCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OutcomeCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	OutcomeCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to OutcomeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OutcomeCode_Insert
(
	
	@OutcomeCodeName nvarchar(max)
)
AS
	SET NOCOUNT ON

	INSERT INTO OutcomeCode
			([OutcomeCodeName] )
	VALUES	(@OutcomeCodeName )
    

	SELECT  Scope_Identity() AS [OutcomeCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OutcomeCode_GetByOutcomeCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OutcomeCode_GetByOutcomeCodeId
GO

-- ==========================================================================================
-- Entity Name:	OutcomeCode_GetByOutcomeCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from OutcomeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OutcomeCode_GetByOutcomeCodeId
	(
	@OutcomeCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM OutcomeCode WHERE [OutcomeCodeId]=@OutcomeCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].OutcomeCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].OutcomeCode_Update
GO

-- ==========================================================================================
-- Entity Name:	OutcomeCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	OutcomeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].OutcomeCode_Update
(
	
	@OutcomeCodeId int,
	@OutcomeCodeName nvarchar(max)
)
AS
	SET NOCOUNT ON

	UPDATE OutcomeCode SET 

		[OutcomeCodeName] = @OutcomeCodeName 
	WHERE [OutcomeCodeId]=@OutcomeCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_GetALL
GO
-- ==========================================================================================
-- Entity Name:	PatientAllergy_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientAllergy
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_Insert
GO
-- ==========================================================================================
-- Entity Name:	PatientAllergy_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO PatientAllergy
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[AllergyName] ,[AllergyTypeId] ,[ReactionName] ,[SeverityId] ,[AllergyCategoryCodeId] ,[StartDate] ,[EndDate] ,[Note] ,[Status] ,[Provider] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@AllergyName ,@AllergyTypeId ,@ReactionName ,@SeverityId ,@AllergyCategoryCodeId ,@StartDate ,@EndDate ,@Note ,@Status ,@Provider ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [PatientAllergyId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_GetByPatientAllergyId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_GetByPatientAllergyId
GO

-- ==========================================================================================
-- Entity Name:	PatientAllergy_GetByPatientAllergyId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_GetByPatientAllergyId
	(
	@PatientAllergyId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientAllergy WHERE [PatientAllergyId]=@PatientAllergyId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_Update
GO

-- ==========================================================================================
-- Entity Name:	PatientAllergy_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_Update
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
	SET NOCOUNT ON

	UPDATE PatientAllergy SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[TenantId] = @TenantId ,
		[AllergyName] = @AllergyName ,
		[AllergyTypeId] = @AllergyTypeId ,
		[ReactionName] = @ReactionName ,
		[SeverityId] = @SeverityId ,
		[AllergyCategoryCodeId] = @AllergyCategoryCodeId ,
		[StartDate] = @StartDate ,
		[EndDate] = @EndDate ,
		[Note] = @Note ,
		[Status] = @Status ,
		[Provider] = @Provider ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [PatientAllergyId]=@PatientAllergyId
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	PatientAllergy_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientAllergy WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	PatientAllergy_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientAllergy WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientAllergy_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientAllergy_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	PatientAllergy_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientAllergy table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientAllergy_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientAllergy WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_GetALL
GO
-- ==========================================================================================
-- Entity Name:	PatientData_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientData
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_Insert
GO
-- ==========================================================================================
-- Entity Name:	PatientData_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_Insert
(
	
	@TenantId int,
	@Fname nvarchar(50),
	@Lname nvarchar(50),
	@Mname nvarchar(50),
	@DOB date = NULL,
	@Street nvarchar(50),
	@PostalCode nvarchar(20),
	@City nvarchar(40),
	@State nvarchar(20),
	@County nvarchar(50),
	@CountryCode nvarchar(2),
	@DriversLicense nvarchar(50),
	@IdentificationNumber nvarchar(25),
	@PhoneHome nvarchar(20),
	@EmergencyContactPhone nvarchar(20),
	@EmergencyContactName nvarchar(50),
	@ContactRelationship nvarchar(20),
	@PhoneCell nvarchar(20),
	@Gender nvarchar(1),
	@Email nvarchar(50),
	@Race nvarchar(50),
	@Ethnicity nvarchar(50),
	@BillingNote nvarchar(50) = NULL,
	@DeceasedDate datetime2 = NULL,
	@DeceasedReason nvarchar(350),
	@CurrentlyInVisit bit,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO PatientData
			([TenantId] ,[Fname] ,[Lname] ,[Mname] ,[DOB] ,[Street] ,[PostalCode] ,[City] ,[State] ,[County] ,[CountryCode] ,[DriversLicense] ,[IdentificationNumber] ,[PhoneHome] ,[EmergencyContactPhone] ,[EmergencyContactName] ,[ContactRelationship] ,[PhoneCell] ,[Gender] ,[Email] ,[Race] ,[Ethnicity] ,[BillingNote] ,[DeceasedDate] ,[DeceasedReason] ,[CurrentlyInVisit] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@TenantId ,@Fname ,@Lname ,@Mname ,@DOB ,@Street ,@PostalCode ,@City ,@State ,@County ,@CountryCode ,@DriversLicense ,@IdentificationNumber ,@PhoneHome ,@EmergencyContactPhone ,@EmergencyContactName ,@ContactRelationship ,@PhoneCell ,@Gender ,@Email ,@Race ,@Ethnicity ,@BillingNote ,@DeceasedDate ,@DeceasedReason ,@CurrentlyInVisit ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Pid];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	PatientData_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientData WHERE [Pid]=@Pid
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_Update
GO

-- ==========================================================================================
-- Entity Name:	PatientData_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_Update
(
	
	@Pid bigint,
	@TenantId int,
	@Fname nvarchar(50),
	@Lname nvarchar(50),
	@Mname nvarchar(50),
	@DOB date = NULL,
	@Street nvarchar(50),
	@PostalCode nvarchar(20),
	@City nvarchar(40),
	@State nvarchar(20),
	@County nvarchar(50),
	@CountryCode nvarchar(2),
	@DriversLicense nvarchar(50),
	@IdentificationNumber nvarchar(25),
	@PhoneHome nvarchar(20),
	@EmergencyContactPhone nvarchar(20),
	@EmergencyContactName nvarchar(50),
	@ContactRelationship nvarchar(20),
	@PhoneCell nvarchar(20),
	@Gender nvarchar(1),
	@Email nvarchar(50),
	@Race nvarchar(50),
	@Ethnicity nvarchar(50),
	@BillingNote nvarchar(50) = NULL,
	@DeceasedDate datetime2 = NULL,
	@DeceasedReason nvarchar(350),
	@CurrentlyInVisit bit,
	@CreateDate datetime2 = NULL,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	UPDATE PatientData SET 

		[TenantId] = @TenantId ,
		[Fname] = @Fname ,
		[Lname] = @Lname ,
		[Mname] = @Mname ,
		[DOB] = @DOB ,
		[Street] = @Street ,
		[PostalCode] = @PostalCode ,
		[City] = @City ,
		[State] = @State ,
		[County] = @County ,
		[CountryCode] = @CountryCode ,
		[DriversLicense] = @DriversLicense ,
		[IdentificationNumber] = @IdentificationNumber ,
		[PhoneHome] = @PhoneHome ,
		[EmergencyContactPhone] = @EmergencyContactPhone ,
		[EmergencyContactName] = @EmergencyContactName ,
		[ContactRelationship] = @ContactRelationship ,
		[PhoneCell] = @PhoneCell ,
		[Gender] = @Gender ,
		[Email] = @Email ,
		[Race] = @Race ,
		[Ethnicity] = @Ethnicity ,
		[BillingNote] = @BillingNote ,
		[DeceasedDate] = @DeceasedDate ,
		[DeceasedReason] = @DeceasedReason ,
		[CurrentlyInVisit] = @CurrentlyInVisit ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Pid]=@Pid
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_GetByLname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_GetByLname
GO

-- ==========================================================================================
-- Entity Name:	PatientData_GetByLname
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_GetByLname
	(
	@Lname nvarchar(50)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientData WHERE [Lname]=@Lname   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_GetByMname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_GetByMname
GO

-- ==========================================================================================
-- Entity Name:	PatientData_GetByMname
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_GetByMname
	(
	@Mname nvarchar(50)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientData WHERE [Mname]=@Mname   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_GetByFname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_GetByFname
GO

-- ==========================================================================================
-- Entity Name:	PatientData_GetByFname
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_GetByFname
	(
	@Fname nvarchar(50)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientData WHERE [Fname]=@Fname   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientData_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientData_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	PatientData_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientData table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientData_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientData WHERE [TenantId]=@TenantId   
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpAuditLogs_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpAuditLogs_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AbpAuditLogs_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AbpAuditLogs table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpAuditLogs_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpAuditLogs
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpAuditLogs_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpAuditLogs_Insert
GO
-- ==========================================================================================
-- Entity Name:	AbpAuditLogs_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AbpAuditLogs table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpAuditLogs_Insert
(
	
	@TenantId int = NULL,
	@UserId bigint = NULL,
	@ServiceName nvarchar(256) = NULL,
	@MethodName nvarchar(256) = NULL,
	@Parameters nvarchar(1024) = NULL,
	@ExecutionTime datetime,
	@ExecutionDuration int,
	@ClientIpAddress nvarchar(64) = NULL,
	@ClientName nvarchar(128) = NULL,
	@BrowserInfo nvarchar(256) = NULL,
	@Exception nvarchar(2000) = NULL,
	@ImpersonatorUserId bigint = NULL,
	@ImpersonatorTenantId int = NULL,
	@CustomData nvarchar(2000) = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO AbpAuditLogs
			([TenantId] ,[UserId] ,[ServiceName] ,[MethodName] ,[Parameters] ,[ExecutionTime] ,[ExecutionDuration] ,[ClientIpAddress] ,[ClientName] ,[BrowserInfo] ,[Exception] ,[ImpersonatorUserId] ,[ImpersonatorTenantId] ,[CustomData] )
	VALUES	(@TenantId ,@UserId ,@ServiceName ,@MethodName ,@Parameters ,@ExecutionTime ,@ExecutionDuration ,@ClientIpAddress ,@ClientName ,@BrowserInfo ,@Exception ,@ImpersonatorUserId ,@ImpersonatorTenantId ,@CustomData )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpAuditLogs_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpAuditLogs_GetById
GO

-- ==========================================================================================
-- Entity Name:	AbpAuditLogs_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpAuditLogs table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpAuditLogs_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpAuditLogs WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpAuditLogs_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpAuditLogs_Update
GO

-- ==========================================================================================
-- Entity Name:	AbpAuditLogs_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AbpAuditLogs table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpAuditLogs_Update
(
	
	@Id bigint,
	@TenantId int = NULL,
	@UserId bigint = NULL,
	@ServiceName nvarchar(256) = NULL,
	@MethodName nvarchar(256) = NULL,
	@Parameters nvarchar(1024) = NULL,
	@ExecutionTime datetime,
	@ExecutionDuration int,
	@ClientIpAddress nvarchar(64) = NULL,
	@ClientName nvarchar(128) = NULL,
	@BrowserInfo nvarchar(256) = NULL,
	@Exception nvarchar(2000) = NULL,
	@ImpersonatorUserId bigint = NULL,
	@ImpersonatorTenantId int = NULL,
	@CustomData nvarchar(2000) = NULL
)
AS
	SET NOCOUNT ON

	UPDATE AbpAuditLogs SET 

		[TenantId] = @TenantId ,
		[UserId] = @UserId ,
		[ServiceName] = @ServiceName ,
		[MethodName] = @MethodName ,
		[Parameters] = @Parameters ,
		[ExecutionTime] = @ExecutionTime ,
		[ExecutionDuration] = @ExecutionDuration ,
		[ClientIpAddress] = @ClientIpAddress ,
		[ClientName] = @ClientName ,
		[BrowserInfo] = @BrowserInfo ,
		[Exception] = @Exception ,
		[ImpersonatorUserId] = @ImpersonatorUserId ,
		[ImpersonatorTenantId] = @ImpersonatorTenantId ,
		[CustomData] = @CustomData 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpAuditLogs_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpAuditLogs_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	AbpAuditLogs_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpAuditLogs table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpAuditLogs_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpAuditLogs WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpAuditLogs_GetByUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpAuditLogs_GetByUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpAuditLogs_GetByUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpAuditLogs table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpAuditLogs_GetByUserId
	(
	@UserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpAuditLogs WHERE [UserId]=@UserId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpAuditLogs_GetByExecutionTime') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpAuditLogs_GetByExecutionTime
GO

-- ==========================================================================================
-- Entity Name:	AbpAuditLogs_GetByExecutionTime
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpAuditLogs table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpAuditLogs_GetByExecutionTime
	(
	@ExecutionTime datetime
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpAuditLogs WHERE [ExecutionTime]=@ExecutionTime   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpPermissions_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpPermissions_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AbpPermissions_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AbpPermissions table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpPermissions_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpPermissions
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpPermissions_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpPermissions_Insert
GO
-- ==========================================================================================
-- Entity Name:	AbpPermissions_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AbpPermissions table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpPermissions_Insert
(
	
	@Name nvarchar(128),
	@IsGranted bit,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@RoleId int = NULL,
	@UserId bigint = NULL,
	@Discriminator nvarchar(128),
	@TenantId int = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO AbpPermissions
			([Name] ,[IsGranted] ,[CreationTime] ,[CreatorUserId] ,[RoleId] ,[UserId] ,[Discriminator] ,[TenantId] )
	VALUES	(@Name ,@IsGranted ,@CreationTime ,@CreatorUserId ,@RoleId ,@UserId ,@Discriminator ,@TenantId )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpPermissions_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpPermissions_GetById
GO

-- ==========================================================================================
-- Entity Name:	AbpPermissions_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpPermissions table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpPermissions_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpPermissions WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpPermissions_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpPermissions_Update
GO

-- ==========================================================================================
-- Entity Name:	AbpPermissions_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AbpPermissions table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpPermissions_Update
(
	
	@Id bigint,
	@Name nvarchar(128),
	@IsGranted bit,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@RoleId int = NULL,
	@UserId bigint = NULL,
	@Discriminator nvarchar(128),
	@TenantId int = NULL
)
AS
	SET NOCOUNT ON

	UPDATE AbpPermissions SET 

		[Name] = @Name ,
		[IsGranted] = @IsGranted ,
		[CreationTime] = @CreationTime ,
		[CreatorUserId] = @CreatorUserId ,
		[RoleId] = @RoleId ,
		[UserId] = @UserId ,
		[Discriminator] = @Discriminator ,
		[TenantId] = @TenantId 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpPermissions_GetByRoleId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpPermissions_GetByRoleId
GO

-- ==========================================================================================
-- Entity Name:	AbpPermissions_GetByRoleId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpPermissions table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpPermissions_GetByRoleId
	(
	@RoleId int
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpPermissions WHERE [RoleId]=@RoleId   AND TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpPermissions_GetByUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpPermissions_GetByUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpPermissions_GetByUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpPermissions table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpPermissions_GetByUserId
	(
	@UserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpPermissions WHERE [UserId]=@UserId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpPermissions_GetByName') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpPermissions_GetByName
GO

-- ==========================================================================================
-- Entity Name:	AbpPermissions_GetByName
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpPermissions table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpPermissions_GetByName
	(
	@Name nvarchar(128)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpPermissions WHERE [Name]=@Name   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AbpRoles_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_Insert
GO
-- ==========================================================================================
-- Entity Name:	AbpRoles_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_Insert
(
	
	@TenantId int = NULL,
	@Name nvarchar(32),
	@DisplayName nvarchar(64),
	@IsStatic bit,
	@IsDefault bit,
	@IsDeleted bit,
	@DeleterUserId bigint = NULL,
	@DeletionTime datetime = NULL,
	@LastModificationTime datetime = NULL,
	@LastModifierUserId bigint = NULL,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO AbpRoles
			([TenantId] ,[Name] ,[DisplayName] ,[IsStatic] ,[IsDefault] ,[IsDeleted] ,[DeleterUserId] ,[DeletionTime] ,[LastModificationTime] ,[LastModifierUserId] ,[CreationTime] ,[CreatorUserId] )
	VALUES	(@TenantId ,@Name ,@DisplayName ,@IsStatic ,@IsDefault ,@IsDeleted ,@DeleterUserId ,@DeletionTime ,@LastModificationTime ,@LastModifierUserId ,@CreationTime ,@CreatorUserId )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetById
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetById
	(
	@Id int
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_Update
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_Update
(
	
	@Id int,
	@TenantId int = NULL,
	@Name nvarchar(32),
	@DisplayName nvarchar(64),
	@IsStatic bit,
	@IsDefault bit,
	@IsDeleted bit,
	@DeleterUserId bigint = NULL,
	@DeletionTime datetime = NULL,
	@LastModificationTime datetime = NULL,
	@LastModifierUserId bigint = NULL,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL
)
AS
	SET NOCOUNT ON

	UPDATE AbpRoles SET 

		[TenantId] = @TenantId ,
		[Name] = @Name ,
		[DisplayName] = @DisplayName ,
		[IsStatic] = @IsStatic ,
		[IsDefault] = @IsDefault ,
		[IsDeleted] = @IsDeleted ,
		[DeleterUserId] = @DeleterUserId ,
		[DeletionTime] = @DeletionTime ,
		[LastModificationTime] = @LastModificationTime ,
		[LastModifierUserId] = @LastModifierUserId ,
		[CreationTime] = @CreationTime ,
		[CreatorUserId] = @CreatorUserId 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetByDeleterUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetByDeleterUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_GetByDeleterUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetByDeleterUserId
	(
	@DeleterUserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles WHERE [DeleterUserId]=@DeleterUserId   AND TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetByLastModifierUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetByLastModifierUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_GetByLastModifierUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetByLastModifierUserId
	(
	@LastModifierUserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles WHERE [LastModifierUserId]=@LastModifierUserId   AND TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetByCreatorUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetByCreatorUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_GetByCreatorUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetByCreatorUserId
	(
	@CreatorUserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles WHERE [CreatorUserId]=@CreatorUserId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetByIsDeleted') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetByIsDeleted
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_GetByIsDeleted
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetByIsDeleted
	(
	@IsDeleted bit
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles WHERE [IsDeleted]=@IsDeleted   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpRoles_GetByName') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpRoles_GetByName
GO

-- ==========================================================================================
-- Entity Name:	AbpRoles_GetByName
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpRoles_GetByName
	(
	@Name nvarchar(32)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpRoles WHERE [Name]=@Name   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AbpUsers_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_Insert
GO
-- ==========================================================================================
-- Entity Name:	AbpUsers_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_Insert
(
	
	@TenantId int = NULL,
	@AuthenticationSource nvarchar(64) = NULL,
	@Name nvarchar(32),
	@Surname nvarchar(32),
	@UserName nvarchar(32),
	@Password nvarchar(128),
	@EmailAddress nvarchar(256),
	@IsEmailConfirmed bit,
	@EmailConfirmationCode nvarchar(128) = NULL,
	@PasswordResetCode nvarchar(328) = NULL,
	@LastLoginTime datetime = NULL,
	@IsActive bit,
	@IsDeleted bit,
	@DeleterUserId bigint = NULL,
	@DeletionTime datetime = NULL,
	@LastModificationTime datetime = NULL,
	@LastModifierUserId bigint = NULL,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@LockoutEndDateUtc datetime = NULL,
	@AccessFailedCount int,
	@IsLockoutEnabled bit,
	@PhoneNumber nvarchar(max) = NULL,
	@IsPhoneNumberConfirmed bit,
	@SecurityStamp nvarchar(max) = NULL,
	@IsTwoFactorEnabled bit
)
AS
	SET NOCOUNT ON

	INSERT INTO AbpUsers
			([TenantId] ,[AuthenticationSource] ,[Name] ,[Surname] ,[UserName] ,[Password] ,[EmailAddress] ,[IsEmailConfirmed] ,[EmailConfirmationCode] ,[PasswordResetCode] ,[LastLoginTime] ,[IsActive] ,[IsDeleted] ,[DeleterUserId] ,[DeletionTime] ,[LastModificationTime] ,[LastModifierUserId] ,[CreationTime] ,[CreatorUserId] ,[LockoutEndDateUtc] ,[AccessFailedCount] ,[IsLockoutEnabled] ,[PhoneNumber] ,[IsPhoneNumberConfirmed] ,[SecurityStamp] ,[IsTwoFactorEnabled] )
	VALUES	(@TenantId ,@AuthenticationSource ,@Name ,@Surname ,@UserName ,@Password ,@EmailAddress ,@IsEmailConfirmed ,@EmailConfirmationCode ,@PasswordResetCode ,@LastLoginTime ,@IsActive ,@IsDeleted ,@DeleterUserId ,@DeletionTime ,@LastModificationTime ,@LastModifierUserId ,@CreationTime ,@CreatorUserId ,@LockoutEndDateUtc ,@AccessFailedCount ,@IsLockoutEnabled ,@PhoneNumber ,@IsPhoneNumberConfirmed ,@SecurityStamp ,@IsTwoFactorEnabled )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetById
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_Update
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_Update
(
	
	@Id bigint,
	@TenantId int = NULL,
	@AuthenticationSource nvarchar(64) = NULL,
	@Name nvarchar(32),
	@Surname nvarchar(32),
	@UserName nvarchar(32),
	@Password nvarchar(128),
	@EmailAddress nvarchar(256),
	@IsEmailConfirmed bit,
	@EmailConfirmationCode nvarchar(128) = NULL,
	@PasswordResetCode nvarchar(328) = NULL,
	@LastLoginTime datetime = NULL,
	@IsActive bit,
	@IsDeleted bit,
	@DeleterUserId bigint = NULL,
	@DeletionTime datetime = NULL,
	@LastModificationTime datetime = NULL,
	@LastModifierUserId bigint = NULL,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@LockoutEndDateUtc datetime = NULL,
	@AccessFailedCount int,
	@IsLockoutEnabled bit,
	@PhoneNumber nvarchar(max) = NULL,
	@IsPhoneNumberConfirmed bit,
	@SecurityStamp nvarchar(max) = NULL,
	@IsTwoFactorEnabled bit
)
AS
	SET NOCOUNT ON

	UPDATE AbpUsers SET 

		[TenantId] = @TenantId ,
		[AuthenticationSource] = @AuthenticationSource ,
		[Name] = @Name ,
		[Surname] = @Surname ,
		[UserName] = @UserName ,
		[Password] = @Password ,
		[EmailAddress] = @EmailAddress ,
		[IsEmailConfirmed] = @IsEmailConfirmed ,
		[EmailConfirmationCode] = @EmailConfirmationCode ,
		[PasswordResetCode] = @PasswordResetCode ,
		[LastLoginTime] = @LastLoginTime ,
		[IsActive] = @IsActive ,
		[IsDeleted] = @IsDeleted ,
		[DeleterUserId] = @DeleterUserId ,
		[DeletionTime] = @DeletionTime ,
		[LastModificationTime] = @LastModificationTime ,
		[LastModifierUserId] = @LastModifierUserId ,
		[CreationTime] = @CreationTime ,
		[CreatorUserId] = @CreatorUserId ,
		[LockoutEndDateUtc] = @LockoutEndDateUtc ,
		[AccessFailedCount] = @AccessFailedCount ,
		[IsLockoutEnabled] = @IsLockoutEnabled ,
		[PhoneNumber] = @PhoneNumber ,
		[IsPhoneNumberConfirmed] = @IsPhoneNumberConfirmed ,
		[SecurityStamp] = @SecurityStamp ,
		[IsTwoFactorEnabled] = @IsTwoFactorEnabled 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetByDeleterUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetByDeleterUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetByDeleterUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetByDeleterUserId
	(
	@DeleterUserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [DeleterUserId]=@DeleterUserId   AND TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetByLastModifierUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetByLastModifierUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetByLastModifierUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetByLastModifierUserId
	(
	@LastModifierUserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [LastModifierUserId]=@LastModifierUserId   AND TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetByCreatorUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetByCreatorUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetByCreatorUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetByCreatorUserId
	(
	@CreatorUserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [CreatorUserId]=@CreatorUserId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetByUserName') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetByUserName
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetByUserName
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetByUserName
	(
	@UserName nvarchar(32)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [UserName]=@UserName   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetByIsDeleted') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetByIsDeleted
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetByIsDeleted
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetByIsDeleted
	(
	@IsDeleted bit
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [IsDeleted]=@IsDeleted   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUsers_GetByEmailAddress') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUsers_GetByEmailAddress
GO

-- ==========================================================================================
-- Entity Name:	AbpUsers_GetByEmailAddress
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpUsers table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUsers_GetByEmailAddress
	(
	@EmailAddress nvarchar(256)
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUsers WHERE [EmailAddress]=@EmailAddress   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUserRoles_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUserRoles_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AbpUserRoles_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AbpUserRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUserRoles_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUserRoles
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUserRoles_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUserRoles_Insert
GO
-- ==========================================================================================
-- Entity Name:	AbpUserRoles_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AbpUserRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUserRoles_Insert
(
	
	@UserId bigint,
	@RoleId int,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@TenantId int = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO AbpUserRoles
			([UserId] ,[RoleId] ,[CreationTime] ,[CreatorUserId] ,[TenantId] )
	VALUES	(@UserId ,@RoleId ,@CreationTime ,@CreatorUserId ,@TenantId )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUserRoles_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUserRoles_GetById
GO

-- ==========================================================================================
-- Entity Name:	AbpUserRoles_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpUserRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUserRoles_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUserRoles WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUserRoles_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUserRoles_Update
GO

-- ==========================================================================================
-- Entity Name:	AbpUserRoles_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AbpUserRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUserRoles_Update
(
	
	@Id bigint,
	@UserId bigint,
	@RoleId int,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@TenantId int = NULL
)
AS
	SET NOCOUNT ON

	UPDATE AbpUserRoles SET 

		[UserId] = @UserId ,
		[RoleId] = @RoleId ,
		[CreationTime] = @CreationTime ,
		[CreatorUserId] = @CreatorUserId ,
		[TenantId] = @TenantId 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUserRoles_GetByUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUserRoles_GetByUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpUserRoles_GetByUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpUserRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUserRoles_GetByUserId
	(
	@UserId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUserRoles WHERE [UserId]=@UserId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpUserRoles_GetByRoleId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpUserRoles_GetByRoleId
GO

-- ==========================================================================================
-- Entity Name:	AbpUserRoles_GetByRoleId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpUserRoles table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpUserRoles_GetByRoleId
	(
	@RoleId int
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpUserRoles WHERE [RoleId]=@RoleId   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AbpTenants_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AbpTenants
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_Insert
GO
-- ==========================================================================================
-- Entity Name:	AbpTenants_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_Insert
(
	
	@TenancyName nvarchar(64),
	@Name nvarchar(128),
	@IsActive bit,
	@IsDeleted bit,
	@DeleterUserId bigint = NULL,
	@DeletionTime datetime = NULL,
	@LastModificationTime datetime = NULL,
	@LastModifierUserId bigint = NULL,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@EditionId int = NULL,
	@ConnectionString nvarchar(1024) = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO AbpTenants
			([TenancyName] ,[Name] ,[IsActive] ,[IsDeleted] ,[DeleterUserId] ,[DeletionTime] ,[LastModificationTime] ,[LastModifierUserId] ,[CreationTime] ,[CreatorUserId] ,[EditionId] ,[ConnectionString] )
	VALUES	(@TenancyName ,@Name ,@IsActive ,@IsDeleted ,@DeleterUserId ,@DeletionTime ,@LastModificationTime ,@LastModifierUserId ,@CreationTime ,@CreatorUserId ,@EditionId ,@ConnectionString )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_GetById
GO

-- ==========================================================================================
-- Entity Name:	AbpTenants_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_GetById
	(
	@Id int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpTenants WHERE [Id]=@Id
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_Update
GO

-- ==========================================================================================
-- Entity Name:	AbpTenants_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_Update
(
	
	@Id int,
	@TenancyName nvarchar(64),
	@Name nvarchar(128),
	@IsActive bit,
	@IsDeleted bit,
	@DeleterUserId bigint = NULL,
	@DeletionTime datetime = NULL,
	@LastModificationTime datetime = NULL,
	@LastModifierUserId bigint = NULL,
	@CreationTime datetime,
	@CreatorUserId bigint = NULL,
	@EditionId int = NULL,
	@ConnectionString nvarchar(1024) = NULL
)
AS
	SET NOCOUNT ON

	UPDATE AbpTenants SET 

		[TenancyName] = @TenancyName ,
		[Name] = @Name ,
		[IsActive] = @IsActive ,
		[IsDeleted] = @IsDeleted ,
		[DeleterUserId] = @DeleterUserId ,
		[DeletionTime] = @DeletionTime ,
		[LastModificationTime] = @LastModificationTime ,
		[LastModifierUserId] = @LastModifierUserId ,
		[CreationTime] = @CreationTime ,
		[CreatorUserId] = @CreatorUserId ,
		[EditionId] = @EditionId ,
		[ConnectionString] = @ConnectionString 
	WHERE [Id]=@Id
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_GetByDeleterUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_GetByDeleterUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpTenants_GetByDeleterUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_GetByDeleterUserId
	(
	@DeleterUserId bigint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpTenants WHERE [DeleterUserId]=@DeleterUserId   
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_GetByLastModifierUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_GetByLastModifierUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpTenants_GetByLastModifierUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_GetByLastModifierUserId
	(
	@LastModifierUserId bigint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpTenants WHERE [LastModifierUserId]=@LastModifierUserId   
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_GetByCreatorUserId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_GetByCreatorUserId
GO

-- ==========================================================================================
-- Entity Name:	AbpTenants_GetByCreatorUserId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting rows by specified foreign key name from AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_GetByCreatorUserId
	(
	@CreatorUserId bigint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpTenants WHERE [CreatorUserId]=@CreatorUserId   
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_GetByIsDeleted') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_GetByIsDeleted
GO

-- ==========================================================================================
-- Entity Name:	AbpTenants_GetByIsDeleted
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_GetByIsDeleted
	(
	@IsDeleted bit
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpTenants WHERE [IsDeleted]=@IsDeleted   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbpTenants_GetByTenancyName') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbpTenants_GetByTenancyName
GO

-- ==========================================================================================
-- Entity Name:	AbpTenants_GetByTenancyName
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbpTenants table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbpTenants_GetByTenancyName
	(
	@TenancyName nvarchar(64)
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbpTenants WHERE [TenancyName]=@TenancyName   
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientReviewOfSystem_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientReviewOfSystem_GetALL
GO
-- ==========================================================================================
-- Entity Name:	PatientReviewOfSystem_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientReviewOfSystem_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientReviewOfSystem
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientReviewOfSystem_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientReviewOfSystem_Insert
GO
-- ==========================================================================================
-- Entity Name:	PatientReviewOfSystem_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientReviewOfSystem_Insert
(
	
	@Pid bigint,
	@VisitId bigint,
	@TenantId int,
	@ReviewOfSystemCodeId int,
	@NormalLimits bit,
	@Note nvarchar(max) = NULL,
	@CreateDate datetime2,
	@CreatedBy bigint
)
AS
	SET NOCOUNT ON

	INSERT INTO PatientReviewOfSystem
			([Pid] ,[VisitId] ,[TenantId] ,[ReviewOfSystemCodeId] ,[NormalLimits] ,[Note] ,[CreateDate] ,[CreatedBy] )
	VALUES	(@Pid ,@VisitId ,@TenantId ,@ReviewOfSystemCodeId ,@NormalLimits ,@Note ,@CreateDate ,@CreatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientReviewOfSystem_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientReviewOfSystem_GetById
GO

-- ==========================================================================================
-- Entity Name:	PatientReviewOfSystem_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientReviewOfSystem_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientReviewOfSystem WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientReviewOfSystem_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientReviewOfSystem_Update
GO

-- ==========================================================================================
-- Entity Name:	PatientReviewOfSystem_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientReviewOfSystem_Update
(
	
	@Id bigint,
	@Pid bigint,
	@VisitId bigint,
	@TenantId int,
	@ReviewOfSystemCodeId int,
	@NormalLimits bit,
	@Note nvarchar(max) = NULL,
	@CreateDate datetime2,
	@CreatedBy bigint
)
AS
	SET NOCOUNT ON

	UPDATE PatientReviewOfSystem SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[TenantId] = @TenantId ,
		[ReviewOfSystemCodeId] = @ReviewOfSystemCodeId ,
		[NormalLimits] = @NormalLimits ,
		[Note] = @Note ,
		[CreateDate] = @CreateDate ,
		[CreatedBy] = @CreatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientReviewOfSystem_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientReviewOfSystem_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	PatientReviewOfSystem_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientReviewOfSystem_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientReviewOfSystem WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientReviewOfSystem_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientReviewOfSystem_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	PatientReviewOfSystem_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientReviewOfSystem_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientReviewOfSystem WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PatientReviewOfSystem_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PatientReviewOfSystem_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	PatientReviewOfSystem_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PatientReviewOfSystem table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PatientReviewOfSystem_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PatientReviewOfSystem WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_GetALL
GO
-- ==========================================================================================
-- Entity Name:	Prescription_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM Prescription
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_Insert
GO
-- ==========================================================================================
-- Entity Name:	Prescription_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO Prescription
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[DrugId] ,[RxNormName] ,[DoseUnitCodeId] ,[DoseSize] ,[Dosage] ,[FrequencyCodeId] ,[DrugRouteCodeId] ,[DrugFormCodeId] ,[Quantity] ,[Refills] ,[ProviderId] ,[StartDate] ,[Duration] ,[EndDate] ,[RefillDate] ,[TherapyCodeId] ,[SubstitutionAllowed] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@DrugId ,@RxNormName ,@DoseUnitCodeId ,@DoseSize ,@Dosage ,@FrequencyCodeId ,@DrugRouteCodeId ,@DrugFormCodeId ,@Quantity ,@Refills ,@ProviderId ,@StartDate ,@Duration ,@EndDate ,@RefillDate ,@TherapyCodeId ,@SubstitutionAllowed ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [PrescriptionId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_GetByPrescriptionId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_GetByPrescriptionId
GO

-- ==========================================================================================
-- Entity Name:	Prescription_GetByPrescriptionId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_GetByPrescriptionId
	(
	@PrescriptionId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Prescription WHERE [PrescriptionId]=@PrescriptionId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_Update
GO

-- ==========================================================================================
-- Entity Name:	Prescription_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_Update
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
	SET NOCOUNT ON

	UPDATE Prescription SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[TenantId] = @TenantId ,
		[DrugId] = @DrugId ,
		[RxNormName] = @RxNormName ,
		[DoseUnitCodeId] = @DoseUnitCodeId ,
		[DoseSize] = @DoseSize ,
		[Dosage] = @Dosage ,
		[FrequencyCodeId] = @FrequencyCodeId ,
		[DrugRouteCodeId] = @DrugRouteCodeId ,
		[DrugFormCodeId] = @DrugFormCodeId ,
		[Quantity] = @Quantity ,
		[Refills] = @Refills ,
		[ProviderId] = @ProviderId ,
		[StartDate] = @StartDate ,
		[Duration] = @Duration ,
		[EndDate] = @EndDate ,
		[RefillDate] = @RefillDate ,
		[TherapyCodeId] = @TherapyCodeId ,
		[SubstitutionAllowed] = @SubstitutionAllowed ,
		[Note] = @Note ,
		[StatusCodeId] = @StatusCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [PrescriptionId]=@PrescriptionId
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	Prescription_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Prescription WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	Prescription_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Prescription WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Prescription_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Prescription_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	Prescription_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Prescription table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Prescription_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Prescription WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbnormalCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbnormalCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AbnormalCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AbnormalCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbnormalCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AbnormalCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbnormalCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbnormalCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AbnormalCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AbnormalCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbnormalCode_Insert
(
	
	@AbnormalCodeName varchar(30)
)
AS
	SET NOCOUNT ON

	INSERT INTO AbnormalCode
			([AbnormalCodeName] )
	VALUES	(@AbnormalCodeName )
    

	SELECT  Scope_Identity() AS [AbnormalCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbnormalCode_GetByAbnormalCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbnormalCode_GetByAbnormalCodeId
GO

-- ==========================================================================================
-- Entity Name:	AbnormalCode_GetByAbnormalCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AbnormalCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbnormalCode_GetByAbnormalCodeId
	(
	@AbnormalCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AbnormalCode WHERE [AbnormalCodeId]=@AbnormalCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AbnormalCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AbnormalCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AbnormalCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AbnormalCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AbnormalCode_Update
(
	
	@AbnormalCodeId int,
	@AbnormalCodeName varchar(30)
)
AS
	SET NOCOUNT ON

	UPDATE AbnormalCode SET 

		[AbnormalCodeName] = @AbnormalCodeName 
	WHERE [AbnormalCodeId]=@AbnormalCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AdministrationSite_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AdministrationSite_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AdministrationSite_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AdministrationSite table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AdministrationSite_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM AdministrationSite
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AdministrationSite_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AdministrationSite_Insert
GO
-- ==========================================================================================
-- Entity Name:	AdministrationSite_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AdministrationSite table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AdministrationSite_Insert
(
	
	@AdministrationSiteName nvarchar(200),
	@TenantId int
)
AS
	SET NOCOUNT ON

	INSERT INTO AdministrationSite
			([AdministrationSiteName] ,[TenantId] )
	VALUES	(@AdministrationSiteName ,@TenantId )
    

	SELECT  Scope_Identity() AS [AdministrationSiteId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AdministrationSite_GetByAdministrationSiteId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AdministrationSite_GetByAdministrationSiteId
GO

-- ==========================================================================================
-- Entity Name:	AdministrationSite_GetByAdministrationSiteId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AdministrationSite table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AdministrationSite_GetByAdministrationSiteId
	(
	@AdministrationSiteId int
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AdministrationSite WHERE [AdministrationSiteId]=@AdministrationSiteId
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AdministrationSite_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AdministrationSite_Update
GO

-- ==========================================================================================
-- Entity Name:	AdministrationSite_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AdministrationSite table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AdministrationSite_Update
(
	
	@AdministrationSiteId int,
	@AdministrationSiteName nvarchar(200),
	@TenantId int
)
AS
	SET NOCOUNT ON

	UPDATE AdministrationSite SET 

		[AdministrationSiteName] = @AdministrationSiteName ,
		[TenantId] = @TenantId 
	WHERE [AdministrationSiteId]=@AdministrationSiteId
   AND TenantId = @TenantId
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PrescriptionCondition_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PrescriptionCondition_GetALL
GO
-- ==========================================================================================
-- Entity Name:	PrescriptionCondition_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from PrescriptionCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PrescriptionCondition_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM PrescriptionCondition
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PrescriptionCondition_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PrescriptionCondition_Insert
GO
-- ==========================================================================================
-- Entity Name:	PrescriptionCondition_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to PrescriptionCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PrescriptionCondition_Insert
(
	
	@PrescriptionId bigint,
	@ICDCodeCNId varchar(7),
	@PrimaryCondition bit
)
AS
	SET NOCOUNT ON

	INSERT INTO PrescriptionCondition
			([PrescriptionId] ,[ICDCodeCNId] ,[PrimaryCondition] )
	VALUES	(@PrescriptionId ,@ICDCodeCNId ,@PrimaryCondition )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PrescriptionCondition_GetByPrescriptionId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PrescriptionCondition_GetByPrescriptionId
GO

-- ==========================================================================================
-- Entity Name:	PrescriptionCondition_GetByPrescriptionId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PrescriptionCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PrescriptionCondition_GetByPrescriptionId
	(
	@PrescriptionId bigint
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PrescriptionCondition WHERE [PrescriptionId]=@PrescriptionId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PrescriptionCondition_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PrescriptionCondition_Update
GO

-- ==========================================================================================
-- Entity Name:	PrescriptionCondition_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	PrescriptionCondition table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PrescriptionCondition_Update
(
	
	@PrescriptionId bigint,
	@ICDCodeCNId varchar(7),
	@PrimaryCondition bit
)
AS
	SET NOCOUNT ON

	UPDATE PrescriptionCondition SET 

		[PrescriptionId] = @PrescriptionId ,
		[ICDCodeCNId] = @ICDCodeCNId ,
		[PrimaryCondition] = @PrimaryCondition 
	WHERE [PrescriptionId]=@PrescriptionId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCategoryCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCategoryCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AllergyCategoryCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AllergyCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCategoryCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyCategoryCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCategoryCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCategoryCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AllergyCategoryCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AllergyCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCategoryCode_Insert
(
	
	@AllergyCategoryCodeId int,
	@CategoryName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	INSERT INTO AllergyCategoryCode
			([AllergyCategoryCodeId] ,[CategoryName] )
	VALUES	(@AllergyCategoryCodeId ,@CategoryName )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCategoryCode_GetByAllergyCategoryCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCategoryCode_GetByAllergyCategoryCodeId
GO

-- ==========================================================================================
-- Entity Name:	AllergyCategoryCode_GetByAllergyCategoryCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AllergyCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCategoryCode_GetByAllergyCategoryCodeId
	(
	@AllergyCategoryCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyCategoryCode WHERE [AllergyCategoryCodeId]=@AllergyCategoryCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCategoryCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCategoryCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AllergyCategoryCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AllergyCategoryCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCategoryCode_Update
(
	
	@AllergyCategoryCodeId int,
	@CategoryName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	UPDATE AllergyCategoryCode SET 

		[AllergyCategoryCodeId] = @AllergyCategoryCodeId ,
		[CategoryName] = @CategoryName 
	WHERE [AllergyCategoryCodeId]=@AllergyCategoryCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PriorityCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PriorityCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	PriorityCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from PriorityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PriorityCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM PriorityCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PriorityCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PriorityCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	PriorityCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to PriorityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PriorityCode_Insert
(
	
	@PriorityCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO PriorityCode
			([PriorityCodeName] )
	VALUES	(@PriorityCodeName )
    

	SELECT  Scope_Identity() AS [PriorityCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PriorityCode_GetByPriorityCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PriorityCode_GetByPriorityCodeId
GO

-- ==========================================================================================
-- Entity Name:	PriorityCode_GetByPriorityCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from PriorityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PriorityCode_GetByPriorityCodeId
	(
	@PriorityCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM PriorityCode WHERE [PriorityCodeId]=@PriorityCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].PriorityCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PriorityCode_Update
GO

-- ==========================================================================================
-- Entity Name:	PriorityCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	PriorityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].PriorityCode_Update
(
	
	@PriorityCodeId int,
	@PriorityCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE PriorityCode SET 

		[PriorityCodeName] = @PriorityCodeName 
	WHERE [PriorityCodeId]=@PriorityCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AllergyCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AllergyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AllergyCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AllergyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCode_Insert
(
	
	@AllergyCodeId int,
	@AllergyName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	INSERT INTO AllergyCode
			([AllergyCodeId] ,[AllergyName] )
	VALUES	(@AllergyCodeId ,@AllergyName )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCode_GetByAllergyCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCode_GetByAllergyCodeId
GO

-- ==========================================================================================
-- Entity Name:	AllergyCode_GetByAllergyCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AllergyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCode_GetByAllergyCodeId
	(
	@AllergyCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyCode WHERE [AllergyCodeId]=@AllergyCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AllergyCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AllergyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyCode_Update
(
	
	@AllergyCodeId int,
	@AllergyName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	UPDATE AllergyCode SET 

		[AllergyCodeId] = @AllergyCodeId ,
		[AllergyName] = @AllergyName 
	WHERE [AllergyCodeId]=@AllergyCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ProcedureOrder_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ProcedureOrder_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ProcedureOrder_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ProcedureOrder_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM ProcedureOrder
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ProcedureOrder_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ProcedureOrder_Insert
GO
-- ==========================================================================================
-- Entity Name:	ProcedureOrder_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ProcedureOrder_Insert
(
	
	@Pid bigint,
	@VisitId bigint,
	@TenantId int,
	@PriorityCodeId int,
	@OrderDate datetime2,
	@OrderdById bigint,
	@LoincCodeId varchar(10),
	@Note nvarchar(max) = NULL,
	@StatusCodeId int,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	INSERT INTO ProcedureOrder
			([Pid] ,[VisitId] ,[TenantId] ,[PriorityCodeId] ,[OrderDate] ,[OrderdById] ,[LoincCodeId] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@TenantId ,@PriorityCodeId ,@OrderDate ,@OrderdById ,@LoincCodeId ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ProcedureOrder_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ProcedureOrder_GetById
GO

-- ==========================================================================================
-- Entity Name:	ProcedureOrder_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ProcedureOrder_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ProcedureOrder WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ProcedureOrder_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ProcedureOrder_Update
GO

-- ==========================================================================================
-- Entity Name:	ProcedureOrder_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ProcedureOrder_Update
(
	
	@Id bigint,
	@Pid bigint,
	@VisitId bigint,
	@TenantId int,
	@PriorityCodeId int,
	@OrderDate datetime2,
	@OrderdById bigint,
	@LoincCodeId varchar(10),
	@Note nvarchar(max) = NULL,
	@StatusCodeId int,
	@CreateDate datetime2,
	@UpdateDate datetime,
	@CreatedBy bigint,
	@UpdatedBy bigint
)
AS
	SET NOCOUNT ON

	UPDATE ProcedureOrder SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[TenantId] = @TenantId ,
		[PriorityCodeId] = @PriorityCodeId ,
		[OrderDate] = @OrderDate ,
		[OrderdById] = @OrderdById ,
		[LoincCodeId] = @LoincCodeId ,
		[Note] = @Note ,
		[StatusCodeId] = @StatusCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ProcedureOrder_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ProcedureOrder_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	ProcedureOrder_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ProcedureOrder_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ProcedureOrder WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ProcedureOrder_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ProcedureOrder_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	ProcedureOrder_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ProcedureOrder_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ProcedureOrder WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ProcedureOrder_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ProcedureOrder_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	ProcedureOrder_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ProcedureOrder table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ProcedureOrder_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ProcedureOrder WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyReactionCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyReactionCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AllergyReactionCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AllergyReactionCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyReactionCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyReactionCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyReactionCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyReactionCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AllergyReactionCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AllergyReactionCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyReactionCode_Insert
(
	
	@ReactionTypeId int,
	@ReactionName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	INSERT INTO AllergyReactionCode
			([ReactionTypeId] ,[ReactionName] )
	VALUES	(@ReactionTypeId ,@ReactionName )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyReactionCode_GetByReactionTypeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyReactionCode_GetByReactionTypeId
GO

-- ==========================================================================================
-- Entity Name:	AllergyReactionCode_GetByReactionTypeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AllergyReactionCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyReactionCode_GetByReactionTypeId
	(
	@ReactionTypeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyReactionCode WHERE [ReactionTypeId]=@ReactionTypeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyReactionCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyReactionCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AllergyReactionCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AllergyReactionCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyReactionCode_Update
(
	
	@ReactionTypeId int,
	@ReactionName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	UPDATE AllergyReactionCode SET 

		[ReactionTypeId] = @ReactionTypeId ,
		[ReactionName] = @ReactionName 
	WHERE [ReactionTypeId]=@ReactionTypeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].RelationshipCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].RelationshipCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	RelationshipCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from RelationshipCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].RelationshipCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM RelationshipCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].RelationshipCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].RelationshipCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	RelationshipCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to RelationshipCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].RelationshipCode_Insert
(
	
	@RelationshipCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO RelationshipCode
			([RelationshipCodeName] )
	VALUES	(@RelationshipCodeName )
    

	SELECT  Scope_Identity() AS [RelationshipCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].RelationshipCode_GetByRelationshipCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].RelationshipCode_GetByRelationshipCodeId
GO

-- ==========================================================================================
-- Entity Name:	RelationshipCode_GetByRelationshipCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from RelationshipCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].RelationshipCode_GetByRelationshipCodeId
	(
	@RelationshipCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM RelationshipCode WHERE [RelationshipCodeId]=@RelationshipCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].RelationshipCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].RelationshipCode_Update
GO

-- ==========================================================================================
-- Entity Name:	RelationshipCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	RelationshipCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].RelationshipCode_Update
(
	
	@RelationshipCodeId int,
	@RelationshipCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE RelationshipCode SET 

		[RelationshipCodeName] = @RelationshipCodeName 
	WHERE [RelationshipCodeId]=@RelationshipCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergySeverityCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergySeverityCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AllergySeverityCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AllergySeverityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergySeverityCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AllergySeverityCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergySeverityCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergySeverityCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AllergySeverityCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AllergySeverityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergySeverityCode_Insert
(
	
	@AllergySeverityCodeId int,
	@AllergySeverityCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	INSERT INTO AllergySeverityCode
			([AllergySeverityCodeId] ,[AllergySeverityCodeName] )
	VALUES	(@AllergySeverityCodeId ,@AllergySeverityCodeName )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergySeverityCode_GetByAllergySeverityCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergySeverityCode_GetByAllergySeverityCodeId
GO

-- ==========================================================================================
-- Entity Name:	AllergySeverityCode_GetByAllergySeverityCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AllergySeverityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergySeverityCode_GetByAllergySeverityCodeId
	(
	@AllergySeverityCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AllergySeverityCode WHERE [AllergySeverityCodeId]=@AllergySeverityCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergySeverityCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergySeverityCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AllergySeverityCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AllergySeverityCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergySeverityCode_Update
(
	
	@AllergySeverityCodeId int,
	@AllergySeverityCodeName nvarchar(1000)
)
AS
	SET NOCOUNT ON

	UPDATE AllergySeverityCode SET 

		[AllergySeverityCodeId] = @AllergySeverityCodeId ,
		[AllergySeverityCodeName] = @AllergySeverityCodeName 
	WHERE [AllergySeverityCodeId]=@AllergySeverityCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultDataCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultDataCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ResultDataCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ResultDataCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultDataCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM ResultDataCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultDataCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultDataCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	ResultDataCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ResultDataCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultDataCode_Insert
(
	
	@ResultDataCodeName varchar(10)
)
AS
	SET NOCOUNT ON

	INSERT INTO ResultDataCode
			([ResultDataCodeName] )
	VALUES	(@ResultDataCodeName )
    

	SELECT  Scope_Identity() AS [ResultDataCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultDataCode_GetByResultDataCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultDataCode_GetByResultDataCodeId
GO

-- ==========================================================================================
-- Entity Name:	ResultDataCode_GetByResultDataCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ResultDataCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultDataCode_GetByResultDataCodeId
	(
	@ResultDataCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ResultDataCode WHERE [ResultDataCodeId]=@ResultDataCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultDataCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultDataCode_Update
GO

-- ==========================================================================================
-- Entity Name:	ResultDataCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ResultDataCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultDataCode_Update
(
	
	@ResultDataCodeId int,
	@ResultDataCodeName varchar(10)
)
AS
	SET NOCOUNT ON

	UPDATE ResultDataCode SET 

		[ResultDataCodeName] = @ResultDataCodeName 
	WHERE [ResultDataCodeId]=@ResultDataCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyTypeCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyTypeCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	AllergyTypeCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from AllergyTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyTypeCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyTypeCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyTypeCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyTypeCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	AllergyTypeCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to AllergyTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyTypeCode_Insert
(
	
	@AllergyTypeId int,
	@AllergyTypeName nvarchar(1000),
	@Priority int
)
AS
	SET NOCOUNT ON

	INSERT INTO AllergyTypeCode
			([AllergyTypeId] ,[AllergyTypeName] ,[Priority] )
	VALUES	(@AllergyTypeId ,@AllergyTypeName ,@Priority )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyTypeCode_GetByAllergyTypeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyTypeCode_GetByAllergyTypeId
GO

-- ==========================================================================================
-- Entity Name:	AllergyTypeCode_GetByAllergyTypeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from AllergyTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyTypeCode_GetByAllergyTypeId
	(
	@AllergyTypeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM AllergyTypeCode WHERE [AllergyTypeId]=@AllergyTypeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].AllergyTypeCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].AllergyTypeCode_Update
GO

-- ==========================================================================================
-- Entity Name:	AllergyTypeCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	AllergyTypeCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].AllergyTypeCode_Update
(
	
	@AllergyTypeId int,
	@AllergyTypeName nvarchar(1000),
	@Priority int
)
AS
	SET NOCOUNT ON

	UPDATE AllergyTypeCode SET 

		[AllergyTypeId] = @AllergyTypeId ,
		[AllergyTypeName] = @AllergyTypeName ,
		[Priority] = @Priority 
	WHERE [AllergyTypeId]=@AllergyTypeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultStatusCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultStatusCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ResultStatusCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ResultStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultStatusCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM ResultStatusCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultStatusCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultStatusCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	ResultStatusCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ResultStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultStatusCode_Insert
(
	
	@ResultStatusCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO ResultStatusCode
			([ResultStatusCodeName] )
	VALUES	(@ResultStatusCodeName )
    

	SELECT  Scope_Identity() AS [ResultStatusCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultStatusCode_GetByResultStatusCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultStatusCode_GetByResultStatusCodeId
GO

-- ==========================================================================================
-- Entity Name:	ResultStatusCode_GetByResultStatusCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ResultStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultStatusCode_GetByResultStatusCodeId
	(
	@ResultStatusCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ResultStatusCode WHERE [ResultStatusCodeId]=@ResultStatusCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ResultStatusCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ResultStatusCode_Update
GO

-- ==========================================================================================
-- Entity Name:	ResultStatusCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ResultStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ResultStatusCode_Update
(
	
	@ResultStatusCodeId int,
	@ResultStatusCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE ResultStatusCode SET 

		[ResultStatusCodeName] = @ResultStatusCodeName 
	WHERE [ResultStatusCodeId]=@ResultStatusCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ReviewOfSystemCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ReviewOfSystemCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM ReviewOfSystemCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	ReviewOfSystemCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ReviewOfSystemCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemCode_Insert
(
	
	@ReviewOfSystemCodeId int,
	@ReviewOfSystemGroupCodeId int,
	@ReviewOfSystemCodeName nvarchar(255),
	@IsShortCode bit
)
AS
	SET NOCOUNT ON

	INSERT INTO ReviewOfSystemCode
			([ReviewOfSystemCodeId] ,[ReviewOfSystemGroupCodeId] ,[ReviewOfSystemCodeName] ,[IsShortCode] )
	VALUES	(@ReviewOfSystemCodeId ,@ReviewOfSystemGroupCodeId ,@ReviewOfSystemCodeName ,@IsShortCode )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemCode_GetByReviewOfSystemCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemCode_GetByReviewOfSystemCodeId
GO

-- ==========================================================================================
-- Entity Name:	ReviewOfSystemCode_GetByReviewOfSystemCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ReviewOfSystemCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemCode_GetByReviewOfSystemCodeId
	(
	@ReviewOfSystemCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ReviewOfSystemCode WHERE [ReviewOfSystemCodeId]=@ReviewOfSystemCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemCode_Update
GO

-- ==========================================================================================
-- Entity Name:	ReviewOfSystemCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ReviewOfSystemCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemCode_Update
(
	
	@ReviewOfSystemCodeId int,
	@ReviewOfSystemGroupCodeId int,
	@ReviewOfSystemCodeName nvarchar(255),
	@IsShortCode bit
)
AS
	SET NOCOUNT ON

	UPDATE ReviewOfSystemCode SET 

		[ReviewOfSystemCodeId] = @ReviewOfSystemCodeId ,
		[ReviewOfSystemGroupCodeId] = @ReviewOfSystemGroupCodeId ,
		[ReviewOfSystemCodeName] = @ReviewOfSystemCodeName ,
		[IsShortCode] = @IsShortCode 
	WHERE [ReviewOfSystemCodeId]=@ReviewOfSystemCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemGroupCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemGroupCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	ReviewOfSystemGroupCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from ReviewOfSystemGroupCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemGroupCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM ReviewOfSystemGroupCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemGroupCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemGroupCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	ReviewOfSystemGroupCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to ReviewOfSystemGroupCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemGroupCode_Insert
(
	
	@ReviewOfSystemGroupCodeId int,
	@ReviewOfSystemGroupCodeName nvarchar(255),
	@SortOrder int
)
AS
	SET NOCOUNT ON

	INSERT INTO ReviewOfSystemGroupCode
			([ReviewOfSystemGroupCodeId] ,[ReviewOfSystemGroupCodeName] ,[SortOrder] )
	VALUES	(@ReviewOfSystemGroupCodeId ,@ReviewOfSystemGroupCodeName ,@SortOrder )
    

GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemGroupCode_GetByReviewOfSystemGroupCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemGroupCode_GetByReviewOfSystemGroupCodeId
GO

-- ==========================================================================================
-- Entity Name:	ReviewOfSystemGroupCode_GetByReviewOfSystemGroupCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from ReviewOfSystemGroupCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemGroupCode_GetByReviewOfSystemGroupCodeId
	(
	@ReviewOfSystemGroupCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM ReviewOfSystemGroupCode WHERE [ReviewOfSystemGroupCodeId]=@ReviewOfSystemGroupCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].ReviewOfSystemGroupCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].ReviewOfSystemGroupCode_Update
GO

-- ==========================================================================================
-- Entity Name:	ReviewOfSystemGroupCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	ReviewOfSystemGroupCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].ReviewOfSystemGroupCode_Update
(
	
	@ReviewOfSystemGroupCodeId int,
	@ReviewOfSystemGroupCodeName nvarchar(255),
	@SortOrder int
)
AS
	SET NOCOUNT ON

	UPDATE ReviewOfSystemGroupCode SET 

		[ReviewOfSystemGroupCodeId] = @ReviewOfSystemGroupCodeId ,
		[ReviewOfSystemGroupCodeName] = @ReviewOfSystemGroupCodeName ,
		[SortOrder] = @SortOrder 
	WHERE [ReviewOfSystemGroupCodeId]=@ReviewOfSystemGroupCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].SpecimenCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].SpecimenCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	SpecimenCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from SpecimenCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].SpecimenCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM SpecimenCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].SpecimenCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].SpecimenCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	SpecimenCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to SpecimenCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].SpecimenCode_Insert
(
	
	@SpecimenCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO SpecimenCode
			([SpecimenCodeName] )
	VALUES	(@SpecimenCodeName )
    

	SELECT  Scope_Identity() AS [SpecimenCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].SpecimenCode_GetBySpecimenCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].SpecimenCode_GetBySpecimenCodeId
GO

-- ==========================================================================================
-- Entity Name:	SpecimenCode_GetBySpecimenCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from SpecimenCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].SpecimenCode_GetBySpecimenCodeId
	(
	@SpecimenCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM SpecimenCode WHERE [SpecimenCodeId]=@SpecimenCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].SpecimenCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].SpecimenCode_Update
GO

-- ==========================================================================================
-- Entity Name:	SpecimenCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	SpecimenCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].SpecimenCode_Update
(
	
	@SpecimenCodeId int,
	@SpecimenCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE SpecimenCode SET 

		[SpecimenCodeName] = @SpecimenCodeName 
	WHERE [SpecimenCodeId]=@SpecimenCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CompletionStatusCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CompletionStatusCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	CompletionStatusCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from CompletionStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].CompletionStatusCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM CompletionStatusCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CompletionStatusCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CompletionStatusCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	CompletionStatusCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to CompletionStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].CompletionStatusCode_Insert
(
	
	@CompletionStatusName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO CompletionStatusCode
			([CompletionStatusName] )
	VALUES	(@CompletionStatusName )
    

	SELECT  Scope_Identity() AS [CompletionStatusCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CompletionStatusCode_GetByCompletionStatusCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CompletionStatusCode_GetByCompletionStatusCodeId
GO

-- ==========================================================================================
-- Entity Name:	CompletionStatusCode_GetByCompletionStatusCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from CompletionStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].CompletionStatusCode_GetByCompletionStatusCodeId
	(
	@CompletionStatusCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM CompletionStatusCode WHERE [CompletionStatusCodeId]=@CompletionStatusCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].CompletionStatusCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].CompletionStatusCode_Update
GO

-- ==========================================================================================
-- Entity Name:	CompletionStatusCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	CompletionStatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].CompletionStatusCode_Update
(
	
	@CompletionStatusCodeId int,
	@CompletionStatusName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE CompletionStatusCode SET 

		[CompletionStatusName] = @CompletionStatusName 
	WHERE [CompletionStatusCodeId]=@CompletionStatusCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].StatusCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].StatusCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	StatusCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from StatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].StatusCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM StatusCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].StatusCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].StatusCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	StatusCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to StatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].StatusCode_Insert
(
	
	@StatusCodeName nvarchar(max)
)
AS
	SET NOCOUNT ON

	INSERT INTO StatusCode
			([StatusCodeName] )
	VALUES	(@StatusCodeName )
    

	SELECT  Scope_Identity() AS [StatusCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].StatusCode_GetByStatusCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].StatusCode_GetByStatusCodeId
GO

-- ==========================================================================================
-- Entity Name:	StatusCode_GetByStatusCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from StatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].StatusCode_GetByStatusCodeId
	(
	@StatusCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM StatusCode WHERE [StatusCodeId]=@StatusCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].StatusCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].StatusCode_Update
GO

-- ==========================================================================================
-- Entity Name:	StatusCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	StatusCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].StatusCode_Update
(
	
	@StatusCodeId int,
	@StatusCodeName nvarchar(max)
)
AS
	SET NOCOUNT ON

	UPDATE StatusCode SET 

		[StatusCodeName] = @StatusCodeName 
	WHERE [StatusCodeId]=@StatusCodeId
   
GO





IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_GetALL
GO
-- ==========================================================================================
-- Entity Name:	Diagnosis_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM Diagnosis
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_Insert
GO
-- ==========================================================================================
-- Entity Name:	Diagnosis_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO Diagnosis
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[ICDCodeCNId] ,[DiagnosisDate] ,[AdministeredById] ,[AdministrationSiteId] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@ICDCodeCNId ,@DiagnosisDate ,@AdministeredById ,@AdministrationSiteId ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_GetById
GO

-- ==========================================================================================
-- Entity Name:	Diagnosis_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Diagnosis WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_Update
GO

-- ==========================================================================================
-- Entity Name:	Diagnosis_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_Update
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
	SET NOCOUNT ON

	UPDATE Diagnosis SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[TenantId] = @TenantId ,
		[ICDCodeCNId] = @ICDCodeCNId ,
		[DiagnosisDate] = @DiagnosisDate ,
		[AdministeredById] = @AdministeredById ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[Note] = @Note ,
		[StatusCodeId] = @StatusCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	Diagnosis_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Diagnosis WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	Diagnosis_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Diagnosis WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Diagnosis_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Diagnosis_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	Diagnosis_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Diagnosis table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Diagnosis_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Diagnosis WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_GetALL
GO
-- ==========================================================================================
-- Entity Name:	Surgery_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM Surgery
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_Insert
GO
-- ==========================================================================================
-- Entity Name:	Surgery_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_Insert
(
	
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
	SET NOCOUNT ON

	INSERT INTO Surgery
			([Pid] ,[VisitId] ,[Archived] ,[ParentId] ,[TenantId] ,[ICDCodePCSId] ,[SurgeryDate] ,[AdministeredById] ,[AdministrationSiteId] ,[OutcomeCodeId] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@VisitId ,@Archived ,@ParentId ,@TenantId ,@ICDCodePCSId ,@SurgeryDate ,@AdministeredById ,@AdministrationSiteId ,@OutcomeCodeId ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_GetById
GO

-- ==========================================================================================
-- Entity Name:	Surgery_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Surgery WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_Update
GO

-- ==========================================================================================
-- Entity Name:	Surgery_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_Update
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
	SET NOCOUNT ON

	UPDATE Surgery SET 

		[Pid] = @Pid ,
		[VisitId] = @VisitId ,
		[Archived] = @Archived ,
		[ParentId] = @ParentId ,
		[TenantId] = @TenantId ,
		[ICDCodePCSId] = @ICDCodePCSId ,
		[SurgeryDate] = @SurgeryDate ,
		[AdministeredById] = @AdministeredById ,
		[AdministrationSiteId] = @AdministrationSiteId ,
		[OutcomeCodeId] = @OutcomeCodeId ,
		[Note] = @Note ,
		[StatusCodeId] = @StatusCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_GetByVisitId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_GetByVisitId
GO

-- ==========================================================================================
-- Entity Name:	Surgery_GetByVisitId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_GetByVisitId
	(
	@VisitId bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Surgery WHERE [VisitId]=@VisitId   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	Surgery_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Surgery WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Surgery_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Surgery_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	Surgery_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Surgery table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Surgery_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Surgery WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Document_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Document_GetALL
GO
-- ==========================================================================================
-- Entity Name:	Document_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from Document table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Document_GetALL
(@TenantId int)
AS
	SET NOCOUNT ON

	SELECT *  FROM Document
  WHERE TenantId = @TenantId
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Document_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Document_Insert
GO
-- ==========================================================================================
-- Entity Name:	Document_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to Document table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Document_Insert
(
	
	@Pid bigint,
	@TenantId int,
	@DocumentTypeCodeId int,
	@DocumentCategoryCodeId int,
	@ServerFileName varchar(1024),
	@DocumentDescription nvarchar(255) = NULL,
	@Note nvarchar(max) = NULL,
	@StatusCodeId int = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	INSERT INTO Document
			([Pid] ,[TenantId] ,[DocumentTypeCodeId] ,[DocumentCategoryCodeId] ,[ServerFileName] ,[DocumentDescription] ,[Note] ,[StatusCodeId] ,[CreateDate] ,[UpdateDate] ,[CreatedBy] ,[UpdatedBy] )
	VALUES	(@Pid ,@TenantId ,@DocumentTypeCodeId ,@DocumentCategoryCodeId ,@ServerFileName ,@DocumentDescription ,@Note ,@StatusCodeId ,@CreateDate ,@UpdateDate ,@CreatedBy ,@UpdatedBy )
    

	SELECT  Scope_Identity() AS [Id];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Document_GetById') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Document_GetById
GO

-- ==========================================================================================
-- Entity Name:	Document_GetById
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Document table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Document_GetById
	(
	@Id bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Document WHERE [Id]=@Id
   AND TenantId = @TenantId
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Document_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Document_Update
GO

-- ==========================================================================================
-- Entity Name:	Document_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	Document table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Document_Update
(
	
	@Id bigint,
	@Pid bigint,
	@TenantId int,
	@DocumentTypeCodeId int,
	@DocumentCategoryCodeId int,
	@ServerFileName varchar(1024),
	@DocumentDescription nvarchar(255) = NULL,
	@Note nvarchar(max) = NULL,
	@StatusCodeId int = NULL,
	@CreateDate datetime2,
	@UpdateDate datetime = NULL,
	@CreatedBy bigint,
	@UpdatedBy bigint = NULL
)
AS
	SET NOCOUNT ON

	UPDATE Document SET 

		[Pid] = @Pid ,
		[TenantId] = @TenantId ,
		[DocumentTypeCodeId] = @DocumentTypeCodeId ,
		[DocumentCategoryCodeId] = @DocumentCategoryCodeId ,
		[ServerFileName] = @ServerFileName ,
		[DocumentDescription] = @DocumentDescription ,
		[Note] = @Note ,
		[StatusCodeId] = @StatusCodeId ,
		[CreateDate] = @CreateDate ,
		[UpdateDate] = @UpdateDate ,
		[CreatedBy] = @CreatedBy ,
		[UpdatedBy] = @UpdatedBy 
	WHERE [Id]=@Id
   AND TenantId = @TenantId
GO




IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Document_GetByTenantId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Document_GetByTenantId
GO

-- ==========================================================================================
-- Entity Name:	Document_GetByTenantId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Document table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Document_GetByTenantId
	(
	@TenantId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Document WHERE [TenantId]=@TenantId   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].Document_GetByPid') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].Document_GetByPid
GO

-- ==========================================================================================
-- Entity Name:	Document_GetByPid
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from Document table
-- ==========================================================================================
CREATE PROCEDURE [dbo].Document_GetByPid
	(
	@Pid bigint
	, @TenantId int
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM Document WHERE [Pid]=@Pid   AND TenantId = @TenantId
GO



IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].TherapyCode_GetALL') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].TherapyCode_GetALL
GO
-- ==========================================================================================
-- Entity Name:	TherapyCode_GetALL
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting all rows from TherapyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].TherapyCode_GetALL

AS
	SET NOCOUNT ON

	SELECT *  FROM TherapyCode
  
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].TherapyCode_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].TherapyCode_Insert
GO
-- ==========================================================================================
-- Entity Name:	TherapyCode_Insert
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for inserting values to TherapyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].TherapyCode_Insert
(
	
	@TherapyCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	INSERT INTO TherapyCode
			([TherapyCodeName] )
	VALUES	(@TherapyCodeName )
    

	SELECT  Scope_Identity() AS [TherapyCodeId];
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].TherapyCode_GetByTherapyCodeId') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].TherapyCode_GetByTherapyCodeId
GO

-- ==========================================================================================
-- Entity Name:	TherapyCode_GetByTherapyCodeId
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for selecting a row by specified primary key from TherapyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].TherapyCode_GetByTherapyCodeId
	(
	@TherapyCodeId int
	
	)
AS
	SET NOCOUNT ON

	SELECT *  FROM TherapyCode WHERE [TherapyCodeId]=@TherapyCodeId
   
GO


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].TherapyCode_Update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].TherapyCode_Update
GO

-- ==========================================================================================
-- Entity Name:	TherapyCode_Update
-- Generator:	Salar dotNET DbCodeGenerator
-- Create date:	5/19/2017 8:43:25 PM
-- Description:	This stored procedure is intended for updating 	TherapyCode table
-- ==========================================================================================
CREATE PROCEDURE [dbo].TherapyCode_Update
(
	
	@TherapyCodeId int,
	@TherapyCodeName nvarchar(100)
)
AS
	SET NOCOUNT ON

	UPDATE TherapyCode SET 

		[TherapyCodeName] = @TherapyCodeName 
	WHERE [TherapyCodeId]=@TherapyCodeId
   
GO





	