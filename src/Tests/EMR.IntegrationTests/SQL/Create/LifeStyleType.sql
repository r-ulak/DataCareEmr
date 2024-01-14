/****** Object:  Table [dbo].[LifeStyleType]     ******/
IF OBJECT_ID('dbo.LifeStyleType', 'U') IS NOT NULL 
	DROP TABLE [dbo].[LifeStyleType]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LifeStyleType](
	[LifeStyleTypeId] [int] IDENTITY(1,1) NOT NULL,
	[LifeStyleTypeName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_LifeStyleTypeId] PRIMARY KEY CLUSTERED 
(
	[LifeStyleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)



