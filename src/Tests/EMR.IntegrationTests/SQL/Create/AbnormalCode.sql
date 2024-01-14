
/****** Object:  Table [dbo].[AbnormalCode]     ******/
IF OBJECT_ID('dbo.AbnormalCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AbnormalCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbnormalCode](
	[AbnormalCodeId] [int] IDENTITY(1,1) NOT NULL,
	[AbnormalCodeName] [varchar](30) NOT NULL,
	CONSTRAINT [PK_AbnormalCodeId] PRIMARY KEY CLUSTERED 
(
	[AbnormalCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
