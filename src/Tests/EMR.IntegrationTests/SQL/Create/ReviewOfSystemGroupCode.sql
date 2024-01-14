/****** Object:  Table [dbo].[ReviewOfSystemGroupCode]     ******/
IF OBJECT_ID('dbo.ReviewOfSystemGroupCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ReviewOfSystemGroupCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewOfSystemGroupCode](
	[ReviewOfSystemGroupCodeId] [int]  NOT NULL,
	[ReviewOfSystemGroupCodeName] [nvarchar](255) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ReviewOfSystemGroupCodeId] PRIMARY KEY CLUSTERED 
(
	[ReviewOfSystemGroupCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

