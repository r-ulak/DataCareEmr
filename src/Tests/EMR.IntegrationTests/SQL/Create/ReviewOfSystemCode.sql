/****** Object:  Table [dbo].[ReviewOfSystemCode]     ******/
IF OBJECT_ID('dbo.ReviewOfSystemCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ReviewOfSystemCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewOfSystemCode](
	[ReviewOfSystemCodeId] [int]  NOT NULL,
	[ReviewOfSystemGroupCodeId] [int]  NOT NULL,
	[ReviewOfSystemCodeName] [nvarchar](255) NOT NULL,
	[IsShortCode] [bit]  NOT NULL,
 CONSTRAINT [PK_ReviewOfSystemCodeId] PRIMARY KEY CLUSTERED 
(
	[ReviewOfSystemCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

