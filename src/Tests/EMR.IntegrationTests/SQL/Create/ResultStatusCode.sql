/****** Object:  Table [dbo].[ResultStatusCode]     ******/
IF OBJECT_ID('dbo.ResultStatusCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ResultStatusCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultStatusCode](
	[ResultStatusCodeId] [int] IDENTITY(1,1) NOT NULL,
	[ResultStatusCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_ResultStatusCodeId] PRIMARY KEY CLUSTERED 
(
	[ResultStatusCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

