/****** Object:  Table [dbo].[AllergyCode]     ******/
IF OBJECT_ID('dbo.AllergyCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AllergyCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllergyCode](
	[AllergyCodeId] [int]  NOT NULL,
	[AllergyName] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_AllergyCodeId] PRIMARY KEY CLUSTERED 
(
	[AllergyCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
