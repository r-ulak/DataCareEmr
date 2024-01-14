/****** Object:  Table [dbo].[ICDCodePCS]     ******/
IF OBJECT_ID('dbo.ICDCodePCS', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ICDCodePCS]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ICDCodePCS](
	[ICDCodePCSId] [varchar](7) NOT NULL,
	[ICDCodePCSShortName] [nvarchar](60) NOT NULL,
	[ICDCodePCSName] [nvarchar](max) NOT NULL,
	[TenantId] [int]  NULL,	
	[CreateDate] [datetime2](0)  NULL,
	[UpdateDate] [datetime]  NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,	
	INDEX IX_TenantId NONCLUSTERED (TenantId),	
	CONSTRAINT [PK_ICDCodePCSId] PRIMARY KEY CLUSTERED 
(
	[ICDCodePCSId] ASC
),
	CONSTRAINT UQ_ICDCodePCSId_TenantId UNIQUE(TenantId, ICDCodePCSId)   
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
