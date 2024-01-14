
/****** Object:  Table [dbo].[ImmunizationCode]     ******/
IF OBJECT_ID('dbo.ImmunizationCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[ImmunizationCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImmunizationCode](
	[ImmunizationCodeId] [int] IDENTITY(1,1) NOT NULL,
	[ImmunizationName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ImmunizationCodeId] PRIMARY KEY CLUSTERED 
(
	[ImmunizationCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)