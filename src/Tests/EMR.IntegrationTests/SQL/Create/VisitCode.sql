

/****** Object:  Table [dbo].[VisitCode]     ******/
IF OBJECT_ID('dbo.VisitCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[VisitCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitCode](
	[VisitCodeId] [int] IDENTITY(1,1) NOT NULL,
	[VisitCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_VisitCodeId] PRIMARY KEY CLUSTERED 
(
	[VisitCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

