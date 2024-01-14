/****** Object:  Table [dbo].[AllergyTypeCode]     ******/
IF OBJECT_ID('dbo.AllergyTypeCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AllergyTypeCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllergyTypeCode](
	[AllergyTypeId] [int]  NOT NULL,
	[AllergyTypeName] [nvarchar](1000) NOT NULL,
	[Priority] [int]  NOT NULL,
 CONSTRAINT [PK_AllergyTypeId] PRIMARY KEY CLUSTERED 
(
	[AllergyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

