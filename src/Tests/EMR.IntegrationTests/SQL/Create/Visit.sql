/****** Object:  Table [dbo].[Visit]     ******/
IF OBJECT_ID('dbo.Visit', 'U') IS NOT NULL 
	DROP TABLE [dbo].[Visit]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[Visit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[TenantId] [int] NOT NULL,
	[VisitStatusCodeId] [int] NOT NULL,
	[VisitCodeId] [int] NOT NULL,
	[AdministrationSiteId] [int] NULL,
	[DoctorId] [bigint] NOT NULL,
	[NurseId] [bigint] NOT NULL,	
	[Reason] [nvarchar](1500) NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),	
	CONSTRAINT [PK_Visit_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


