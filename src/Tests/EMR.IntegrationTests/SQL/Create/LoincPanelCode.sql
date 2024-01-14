
/****** Object:	Table [dbo].[LoincPanelCode]		 ******/
IF OBJECT_ID('dbo.LoincPanelCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[LoincPanelCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS LoincPanelCode;
CREATE TABLE LoincPanelCode (
	ParentId [int] not null,
	ParentLoincCodeId [VARCHAR](10) not null,
	ParentName [VARCHAR](255) NULL,
	Id [int] not null,
	Sequence [int] not null,
	LoincCodeId [VARCHAR](10) not null,
	Name [VARCHAR](255) NULL,
	INDEX IX_LoincCodeId NONCLUSTERED (LoincCodeId),
	INDEX IX_ParentLoincCodeId NONCLUSTERED (ParentLoincCodeId),
	CONSTRAINT [PK_LoincCode_ParentId_Id] PRIMARY KEY CLUSTERED 
	(
	[ParentId] ASC, Id ASC
	)	

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)