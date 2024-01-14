

/****** Object:  Table [dbo].[DocumentOrderResult]     ******/
IF OBJECT_ID('dbo.DocumentOrderResult', 'U') IS NOT NULL 
	DROP TABLE [dbo].[DocumentOrderResult]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentOrderResult](
	[DocumentId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderResultId] [bigint] NOT NULL,
	INDEX IX_OrderResultId NONCLUSTERED (OrderResultId),
	CONSTRAINT [PK_DocumentOrderResultId] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)