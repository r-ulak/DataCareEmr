/****** Object:  Table [dbo].[PatientAllergy]     ******/
IF OBJECT_ID('dbo.PatientAllergy', 'U') IS NOT NULL 
	DROP TABLE [dbo].[PatientAllergy]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAllergy](
	[PatientAllergyId] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,	
	[VisitId] [bigint]  NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[TenantId] [int] NOT NULL,
	[AllergyName] [nvarchar](1000) NOT NULL,
	[AllergyTypeId] [int] NOT NULL,
	[ReactionName] [nvarchar](1000) NOT NULL,
	[SeverityId] [int] NOT NULL,
	[AllergyCategoryCodeId] [int]  NOT NULL,
	[StartDate] [datetime2](0) NULL,
	[EndDate] [datetime2](0) NULL,
	[Note] [ntext] NULL,	
	[Status] [varchar](20) NULL,	
	[Provider] [bigint] NOT NULL ,		
	[CreateDate] [datetime2](0) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,	
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
 CONSTRAINT [PK_PatientAllergy_Id] PRIMARY KEY CLUSTERED 
(
	[PatientAllergyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

