/****** Object:  Table [dbo].[InformationSource]     ******/
IF OBJECT_ID('dbo.InformationSource', 'U') IS NOT NULL 
	DROP TABLE [dbo].[InformationSource]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformationSource](
	[InformationSourceId] [int] IDENTITY(1,1) NOT NULL,
	[InformationSourceName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_InformationSourceId] PRIMARY KEY CLUSTERED 
(
	[InformationSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

