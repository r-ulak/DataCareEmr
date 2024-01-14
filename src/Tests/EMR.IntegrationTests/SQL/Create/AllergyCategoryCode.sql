/****** Object:  Table [dbo].[AllergyCategoryCode]     ******/
IF OBJECT_ID('dbo.AllergyCategoryCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AllergyCategoryCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllergyCategoryCode](
	[AllergyCategoryCodeId] [int]  NOT NULL,
	[CategoryName] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_AllergyCategoryCodeId] PRIMARY KEY CLUSTERED 
(
	[AllergyCategoryCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
