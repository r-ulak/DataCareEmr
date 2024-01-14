

/****** Object:  Table [dbo].[LoincRangeCode]     ******/
IF OBJECT_ID('dbo.LoincRangeCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[LoincRangeCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoincRangeCode](
	[LoincCodeId] [varchar](10) NOT NULL ,
	[LoincRangeCodeName] [varchar](30) NOT NULL,
	[TenantId] [int] NOT NULL,
	CONSTRAINT [PK_LoincRangeCodeId] PRIMARY KEY CLUSTERED 
(
	[LoincCodeId], [TenantId]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)