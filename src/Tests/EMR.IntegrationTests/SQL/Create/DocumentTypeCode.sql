

/****** Object:  Table [dbo].[DocumentTypeCode]     ******/
IF OBJECT_ID('dbo.DocumentTypeCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[DocumentTypeCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentTypeCode](
	[DocumentTypeCodeId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeCodeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_DocumentTypeCodeId] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
