
/****** Object:  Table [dbo].[ICDCodeCN]     ******/
IF OBJECT_ID('dbo.ICDCodeCN', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ICDCodeCN]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ICDCodeCN](
	[ICDCodeCNId] [varchar](7) NOT NULL,
	[ICDCodeCNShortName] [nvarchar](60) NOT NULL,
	[ICDCodeCNName] [nvarchar](max) NOT NULL,
	[TenantId] [int]  NULL,	
	[CreateDate] [datetime2](0)  NULL,
	[UpdateDate] [datetime]  NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,	
	INDEX IX_TenantId NONCLUSTERED (TenantId),	
	CONSTRAINT [PK_ICDCodeCNId] PRIMARY KEY CLUSTERED 
(
	[ICDCodeCNId] ASC
),
	CONSTRAINT UQ_ICDCodeCNId_TenantId UNIQUE(TenantId, ICDCodeCNId)   
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)



