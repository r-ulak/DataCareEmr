
/****** Object:  Table [dbo].[DoseUnitCode]     ******/
IF OBJECT_ID('dbo.DoseUnitCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[DoseUnitCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoseUnitCode](
	[DoseUnitCodeId] [int] IDENTITY(1,1) NOT NULL,
	[DoseUnitCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_DoseUnitCodeId] PRIMARY KEY CLUSTERED 
(
	[DoseUnitCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


