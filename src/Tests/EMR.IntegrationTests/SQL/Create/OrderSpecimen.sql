
/****** Object:  Table [dbo].[OrderSpecimen]     ******/
IF OBJECT_ID('dbo.OrderSpecimen', 'U') IS NOT NULL 
	DROP TABLE [dbo].[OrderSpecimen]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[OrderSpecimen](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[Pid] [bigint] NOT NULL,
	[TenantId] [int] NOT NULL,
	[Archived] [bit] NOT NULL DEFAULT 0,
	[ParentId] [bigint] NULL,
	[CollectedDate] [datetime2](0) NOT NULL,
	[CollectedById] [bigint] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[StatusCodeId] [int] NOT NULL,
	[AdministrationSiteId] [int] NULL,
	[SpecimenNumber] [nvarchar](100) NULL,
	[SpecimenCodeId] [int] NOT NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	INDEX IX_OrderId NONCLUSTERED (OrderId),
	CONSTRAINT [PK_OrderSpecimen_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
