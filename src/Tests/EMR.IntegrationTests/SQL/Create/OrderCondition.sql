
/****** Object:  Table [dbo].[OrderCondition]     ******/
IF OBJECT_ID('dbo.OrderCondition', 'U') IS NOT NULL 
	DROP TABLE [dbo].[OrderCondition]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCondition](
	[OrderId] [bigint] NOT NULL,
	[ICDCodeCNId] [varchar](7)  NOT NULL,
	[PrimaryCondition] [bit] NOT NULL,
 CONSTRAINT [PK_OrderCondition] PRIMARY KEY CLUSTERED 
(
	[OrderId], [ICDCodeCNId]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

