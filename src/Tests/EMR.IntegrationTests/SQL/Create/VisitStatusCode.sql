
/****** Object:  Table [dbo].[VisitStatusCode]     ******/
IF OBJECT_ID('dbo.VisitStatusCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[VisitStatusCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitStatusCode](
	[VisitStatusCodeId] [int] IDENTITY(1,1) NOT NULL,
	[VisitStatusCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_VisitStatusCodeId] PRIMARY KEY CLUSTERED 
(
	[VisitStatusCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
