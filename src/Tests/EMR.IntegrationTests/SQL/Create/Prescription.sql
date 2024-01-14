
/****** Object:  Table [dbo].[Prescription]     ******/
IF OBJECT_ID('dbo.Prescription', 'U') IS NOT NULL 
	DROP TABLE [dbo].[Prescription]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[PrescriptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[VisitId] [bigint]  NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[TenantId] [int] NOT NULL,	
	[DrugId] [int]  NOT NULL,
	[RxNormName] [nvarchar](1000) NULL,	
	[DoseUnitCodeId] [int] NOT NULL,
	[DoseSize] [float](10) NOT NULL,
	[Dosage] [int] NOT NULL,
	[FrequencyCodeId] [int] NOT NULL,
	[DrugRouteCodeId] [int]  NOT NULL,
	[DrugFormCodeId] [int] NOT NULL,	
	[Quantity] [int] NOT NULL,	
	[Refills] [int] DEFAULT 0,		
	[ProviderId] [int] NOT NULL ,		
	[StartDate] [datetime2](0) NOT NULL,
	[Duration] [int] NOT NULL,	
	[EndDate] [datetime]  NULL,
	[RefillDate] [datetime] NULL,
	[TherapyCodeId] [int] NOT NULL,	
	[SubstitutionAllowed] [bit] NOT NULL,		
	[Note] [nvarchar](max) NULL,
	[StatusCodeId] [int], 	
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,	
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
 CONSTRAINT [PK_Prescription_Id] PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
