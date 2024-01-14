
/****** Object:  Table [dbo].[LoincUnitCode]     ******/
IF OBJECT_ID('dbo.LoincUnitCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[LoincUnitCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoincUnitCode](
	[LoincCodeId] [varchar](10) NOT NULL ,
	[LoincUnitCodeName] [varchar](30) NOT NULL,
	[TenantId] [int] NOT NULL,
	CONSTRAINT [PK_LoincUnitCodeId] PRIMARY KEY CLUSTERED 
(
	[LoincCodeId] ,[TenantId]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)