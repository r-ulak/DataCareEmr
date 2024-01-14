
/****** Object:  Table [dbo].[OrderResult]     ******/
IF OBJECT_ID('dbo.OrderResult', 'U') IS NOT NULL 
	DROP TABLE [dbo].[OrderResult]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[OrderResult](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[Pid] [bigint] NOT NULL,
	[TenantId] [int] NOT NULL,
	[ResultDate] [datetime2](0) NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[ResultById] [bigint] NOT NULL,
	[ParentLoincCodeId] [varchar](10) NULL,	
	[LoincCodeId] [varchar](10) NOT NULL DEFAULT '',
	[ResultDataCodeId] int NOT NULL DEFAULT 1, -- 'N=Numeric, S=String, F=Formatted, L=Long text'
	[ResultData] varchar(255) NOT NULL DEFAULT '',
	[AdministrationSiteId] [int] NULL,
	[Unit] varchar(10) NULL DEFAULT 0,
	[RangeValue] varchar(255) NULL ,
	[AbnormalCodeId] int NOT NULL DEFAULT 0,
	[Note] [nvarchar](max) NULL,
	[ResultStatusCodeId] [int],
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	INDEX IX_OrderId NONCLUSTERED (OrderId),
	CONSTRAINT [PK_OrderResult_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)