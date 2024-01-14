
/****** Object:  Table [dbo].[DrugCode]     ******/
IF OBJECT_ID('dbo.DrugCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[DrugCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugCode](
	[Id] [int]  NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[SideEffect] [text] NOT NULL,
	[DoseUnit] [nvarchar](25) NOT NULL,
	[MinDoseSize] [float](10) NOT NULL,	
	[MaxDoseSize] [float](10) NOT NULL,	
 CONSTRAINT [PK_DrugId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
