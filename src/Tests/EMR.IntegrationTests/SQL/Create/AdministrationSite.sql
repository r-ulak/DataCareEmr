
/****** Object:  Table [dbo].[AdministrationSite]     ******/
IF OBJECT_ID('dbo.AdministrationSite', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AdministrationSite]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministrationSite](
	[AdministrationSiteId] [int] IDENTITY(1,1) NOT NULL,
	[AdministrationSiteName] [nvarchar](200) NOT NULL,
	[TenantId] [int] NOT NULL,		
 CONSTRAINT [PK_AdministrationSiteId] PRIMARY KEY CLUSTERED 
(
	[AdministrationSiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
