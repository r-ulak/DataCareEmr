
/****** Object:  Table [dbo].[RelationshipCode]     ******/
IF OBJECT_ID('dbo.RelationshipCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[RelationshipCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationshipCode](
	[RelationshipCodeId] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_RelationshipCodeId] PRIMARY KEY CLUSTERED 
(
	[RelationshipCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
