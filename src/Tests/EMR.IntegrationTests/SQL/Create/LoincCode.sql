
/****** Object:	Table [dbo].[LoincCode]		 ******/
IF OBJECT_ID('dbo.LoincCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[LoincCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS LoincCode;
CREATE TABLE LoincCode (
	LoincCodeId [VARCHAR](10) not null,
	Component [VARCHAR](255) NULL,
	Property [VARCHAR](30) NULL,
	TimeAspct [VARCHAR](15) NULL,
	SystemCode [VARCHAR](100) NULL,
	ScaleType [VARCHAR](30) NULL,
	MethodType [VARCHAR](50) NULL,
	ClassName [VARCHAR](20) NULL,
	Formula text,
	UnitsRequired [VARCHAR](1) NULL,
	SubmittedUnits [VARCHAR](35) NULL,
	RelatedNames text null,
	ShortName [VARCHAR](45) NULL,
	ExampleUnits [VARCHAR](255) NULL,
	LongCommonName [VARCHAR](255) NULL,
	UnitsAndRange [VARCHAR](255) NULL,	
	ExampleUcumUnits [VARCHAR](255) NULL,
	TenantId [int]  NULL,
	CONSTRAINT [PK_LoincCode_LoincCodeId] PRIMARY KEY CLUSTERED 
	(
	[LoincCodeId] ASC
	)	

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
