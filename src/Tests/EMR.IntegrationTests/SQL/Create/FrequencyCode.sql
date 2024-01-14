/****** Object:  Table [dbo].[FrequencyCode]     ******/
IF OBJECT_ID('dbo.FrequencyCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[FrequencyCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrequencyCode](
	[FrequencyCodeId] [int] IDENTITY(1,1) NOT NULL,
	[FrequencyCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_FrequencyCodeId] PRIMARY KEY CLUSTERED 
(
	[FrequencyCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
