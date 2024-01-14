/****** Object:  Table [dbo].[PrescriptionCondition]     ******/
IF OBJECT_ID('dbo.PrescriptionCondition', 'U') IS NOT NULL 
	DROP TABLE [dbo].[PrescriptionCondition]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionCondition](
	[PrescriptionId] [bigint] NOT NULL,
	[ICDCodeCNId] [varchar](7)  NOT NULL,
	[PrimaryCondition] [bit] NOT NULL,
 CONSTRAINT [PK_PrescriptionCondition] PRIMARY KEY CLUSTERED 
(
	[PrescriptionId], [ICDCodeCNId]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
