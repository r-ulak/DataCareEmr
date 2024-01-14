/****** Object:  Table [dbo].[AllergyReactionCode]     ******/
IF OBJECT_ID('dbo.AllergyReactionCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AllergyReactionCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllergyReactionCode](
	[ReactionTypeId] [int]  NOT NULL,
	[ReactionName] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ReactionTypeId] PRIMARY KEY CLUSTERED 
(
	[ReactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

