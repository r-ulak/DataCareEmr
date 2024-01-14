

/****** Object:  Table [dbo].[DocumentCategoryCode]     ******/
IF OBJECT_ID('dbo.DocumentCategoryCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[DocumentCategoryCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentCategoryCode](
	[DocumentCategoryCodeId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentCategoryCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_DocumentCategoryCodeId] PRIMARY KEY CLUSTERED 
(
	[DocumentCategoryCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
