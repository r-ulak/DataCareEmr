/****** Object:  Table [dbo].[OutcomeCode]     ******/
IF OBJECT_ID('dbo.OutcomeCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[OutcomeCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeCode](
	[OutcomeCodeId] [int] IDENTITY(1,1) NOT NULL,
	[OutcomeCodeName] [nvarchar](max) NOT NULL,
	CONSTRAINT [PK_OutcomeCodeId] PRIMARY KEY CLUSTERED 
(
	[OutcomeCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
