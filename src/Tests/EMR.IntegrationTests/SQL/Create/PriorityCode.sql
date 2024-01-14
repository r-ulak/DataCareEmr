/****** Object:  Table [dbo].[PriorityCode]     ******/
IF OBJECT_ID('dbo.PriorityCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[PriorityCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriorityCode](
	[PriorityCodeId] [int] IDENTITY(1,1) NOT NULL,
	[PriorityCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_PriorityCodeId] PRIMARY KEY CLUSTERED 
(
	[PriorityCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
