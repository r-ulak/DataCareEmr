
/****** Object:  Table [dbo].[PatientReviewOfSystem]     ******/
IF OBJECT_ID('dbo.PatientReviewOfSystem', 'U') IS NOT NULL 
	DROP TABLE [dbo].[PatientReviewOfSystem]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[PatientReviewOfSystem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[VisitId] [bigint]  NOT NULL,
	[TenantId] [int] NOT NULL,
	[ReviewOfSystemCodeId] [int] NOT NULL,
	[NormalLimits] [bit] NOT NULL DEFAULT 1,
	[Note] [nvarchar](max) NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
	CONSTRAINT [PK_PatientReviewOfSystem_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
