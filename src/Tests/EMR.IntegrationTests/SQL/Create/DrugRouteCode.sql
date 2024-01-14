
/****** Object:  Table [dbo].[DrugRouteCode]     ******/
IF OBJECT_ID('dbo.DrugRouteCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[DrugRouteCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugRouteCode](
	[DrugRouteCodeId] [int]  NOT NULL,
	[DrugRouteCodeName] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DrugRouteCodeId] PRIMARY KEY CLUSTERED 
(
	[DrugRouteCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

