/****** Object:  Table [dbo].[ProcedureOrder]     ******/
IF OBJECT_ID('dbo.ProcedureOrder', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ProcedureOrder]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[ProcedureOrder](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[VisitId] [bigint]  NOT NULL,
	[TenantId] [int] NOT NULL,
	[PriorityCodeId] [int] NOT NULL,
	[OrderDate] [datetime2](0) NOT NULL,
	[OrderdById] [bigint] NOT NULL,
	[LoincCodeId] [varchar](10) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[StatusCodeId] [int] NOT NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
	CONSTRAINT [PK_ProcedureOrder_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

