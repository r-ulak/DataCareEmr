

/****** Object:  Table [dbo].[ResultDataCode]     ******/
IF OBJECT_ID('dbo.ResultDataCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ResultDataCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultDataCode](
	[ResultDataCodeId] [int] IDENTITY(1,1) NOT NULL,
	[ResultDataCodeName] [varchar](10) NOT NULL,
	CONSTRAINT [PK_ResultDataCodeId] PRIMARY KEY CLUSTERED 
(
	[ResultDataCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)