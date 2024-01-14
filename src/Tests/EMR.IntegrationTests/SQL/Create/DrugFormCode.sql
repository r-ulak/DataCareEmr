/****** Object:  Table [dbo].[DrugFormCode]     ******/
IF OBJECT_ID('dbo.DrugFormCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[DrugFormCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugFormCode](
	[DrugFormCodeId] [int] IDENTITY(1,1) NOT NULL,
	[DrugFormCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_DrugFormCodeId] PRIMARY KEY CLUSTERED 
(
	[DrugFormCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
