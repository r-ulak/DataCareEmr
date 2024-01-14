/****** Object:  Table [dbo].[SpecimenCode]     ******/
IF OBJECT_ID('dbo.SpecimenCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[SpecimenCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecimenCode](
	[SpecimenCodeId] [int] IDENTITY(1,1) NOT NULL,
	[SpecimenCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_SpecimenCodeId] PRIMARY KEY CLUSTERED 
(
	[SpecimenCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
