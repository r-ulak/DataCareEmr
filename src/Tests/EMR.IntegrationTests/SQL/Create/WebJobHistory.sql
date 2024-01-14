

/****** Object:  Table [dbo].[WebJobHistory]    Script Date: 6/26/2016 6:43:12 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF OBJECT_ID('dbo.WebJobHistory', 'U') IS NOT NULL 
	DROP TABLE [dbo].[WebJobHistory]
SET ANSI_PADDING ON


CREATE TABLE [dbo].[WebJobHistory](
	[JobId] [smallint] NOT NULL,
	[RunId] [int] IDENTITY(1,1) NOT NULL,
	[CreationTime] [DateTime] NOT NULL,
 CONSTRAINT [PK_WebJobHistory_RunId] PRIMARY KEY CLUSTERED 
(
	[RunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)



SET ANSI_PADDING OFF

