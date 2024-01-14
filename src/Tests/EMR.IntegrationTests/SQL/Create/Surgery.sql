/****** Object:  Table [dbo].[Surgery]     ******/
IF OBJECT_ID('dbo.Surgery', 'U') IS NOT NULL 
	DROP TABLE [dbo].[Surgery]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[Surgery](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[VisitId] [bigint]  NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[TenantId] [int] NOT NULL,
	[ICDCodePCSId] [varchar](7) NOT NULL,
	[SurgeryDate] [datetime2](0) NULL,
	[AdministeredById] [bigint] NULL,
	[AdministrationSiteId] [int] NULL,	
	[OutcomeCodeId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[StatusCodeId] [int], 	
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
	CONSTRAINT [PK_Surgery_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
