/****** Object:  Table [dbo].[StatusCode]     ******/
IF OBJECT_ID('dbo.StatusCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[StatusCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusCode](
	[StatusCodeId] [int] IDENTITY(1,1) NOT NULL,
	[StatusCodeName] [nvarchar](max) NOT NULL,
	CONSTRAINT [PK_StatusCodeId] PRIMARY KEY CLUSTERED 
(
	[StatusCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
