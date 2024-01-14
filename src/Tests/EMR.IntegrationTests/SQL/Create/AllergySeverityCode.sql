/****** Object:  Table [dbo].[AllergySeverityCode]     ******/
IF OBJECT_ID('dbo.AllergySeverityCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AllergySeverityCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllergySeverityCode](
	[AllergySeverityCodeId] [int]  NOT NULL,
	[AllergySeverityCodeName] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_AllergySeverityCodeId] PRIMARY KEY CLUSTERED 
(
	[AllergySeverityCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
