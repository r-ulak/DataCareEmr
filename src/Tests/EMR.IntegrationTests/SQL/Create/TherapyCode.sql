
/****** Object:  Table [dbo].[TherapyCode]     ******/
IF OBJECT_ID('dbo.TherapyCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[TherapyCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapyCode](
	[TherapyCodeId] [int] IDENTITY(1,1) NOT NULL,
	[TherapyCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_TherapyCodeId] PRIMARY KEY CLUSTERED 
(
	[TherapyCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

