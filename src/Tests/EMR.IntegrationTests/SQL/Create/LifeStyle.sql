
/****** Object:  Table [dbo].[LifeStyle]     ******/
IF OBJECT_ID('dbo.LifeStyle', 'U') IS NOT NULL 
	DROP TABLE [dbo].[LifeStyle]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[LifeStyle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[VisitId] [bigint]  NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[TenantId] [int] NOT NULL,
	[LifeStyleTypeId] [int] NOT NULL,	
	[QuitDate] [datetime2](0) NULL,
	[CurrentlyActive] [bit] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
	CONSTRAINT [PK_LifeStyle_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
	) 

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

