
/****** Object:  Table [dbo].[Document]     ******/
IF OBJECT_ID('dbo.Document', 'U') IS NOT NULL 
	DROP TABLE [dbo].[Document]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[Document](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[TenantId] [int] NOT NULL,
	[DocumentTypeCodeId] [int] NOT NULL,
	[DocumentCategoryCodeId] [int] NOT NULL,
	[ServerFileName] [varchar](1024) NOT NULL,	
	[DocumentDescription] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[StatusCodeId] [int] NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	CONSTRAINT [PK_Document_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

