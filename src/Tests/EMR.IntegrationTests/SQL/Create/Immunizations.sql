/****** Object:  Table [dbo].[Immunizations]     ******/
IF OBJECT_ID('dbo.Immunizations', 'U') IS NOT NULL 
	DROP TABLE [dbo].[Immunizations]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[Immunizations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NULL,
	[VisitId] [bigint]  NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[TenantId] [int] NULL,
	[ImmunizationCodeId] [int] NULL,
	[AdministeredDate] [datetime2](0) NULL,
	[AdministeredById] [bigint] NULL,
	[Note] [nvarchar](max) NULL,
	[ExpirationDate] [date] NULL,
	[CompletionStatusCodeId] [int] NULL,
	[Status] [varchar](20) NULL,	
	[InformationSource] [nvarchar](31) NULL,	
	[AdministrationSiteId] [int] NOT NULL,
	[CreateDate] [datetime2](0) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
	CONSTRAINT [PK_Immunizations_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
	)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
