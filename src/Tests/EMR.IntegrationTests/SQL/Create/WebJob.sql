

/****** Object:  Table [dbo].[WebJob]    Script Date: 6/26/2016 6:42:59 PM ******/
SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON

IF OBJECT_ID('dbo.WebJob', 'U') IS NOT NULL 
	DROP TABLE [dbo].[WebJob]
SET ANSI_PADDING ON


CREATE TABLE [dbo].[WebJob](
	[JobId] [smallint] NOT NULL,
	[JobName] [varchar](100) NOT NULL,
	[Permissions] [varchar](150) NOT NULL,	
 CONSTRAINT [PK_WebJob_JobId] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)



SET ANSI_PADDING OFF
