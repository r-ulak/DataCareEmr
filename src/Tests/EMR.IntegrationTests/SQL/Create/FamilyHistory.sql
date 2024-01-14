/****** Object:  Table [dbo].[FamilyHistory]     ******/
IF OBJECT_ID('dbo.FamilyHistory', 'U') IS NOT NULL 
	DROP TABLE [dbo].[FamilyHistory]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[FamilyHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[VisitId] [bigint]  NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[TenantId] [int] NOT NULL,
	[RelationshipCodeId] [int] NOT NULL,
	[ICDCodeCNId] [varchar](7) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[StatusCodeId] [int], 	
	[CreateDate] [datetime2](0) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
	CONSTRAINT [PK_FamilyHistory_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
