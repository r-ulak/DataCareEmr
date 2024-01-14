/****** Object:  Table [dbo].[UserPreference]     ******/
IF OBJECT_ID('dbo.UserPreference', 'U') IS NOT NULL 
	DROP TABLE [dbo].[UserPreference]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[UserPreference](
	[Id] [bigint] NOT NULL,
	[TenantId] [int] NOT NULL,
	[AdministrationSiteId] [int] NULL,
	[CalendarColor] [nvarchar](7) NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	INDEX IX_TenantId NONCLUSTERED (TenantId),	
	CONSTRAINT [PK_UserPreference_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


