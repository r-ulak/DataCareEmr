/****** Object:  Table [dbo].[AppointmentStatusCode]     ******/
IF OBJECT_ID('dbo.AppointmentStatusCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AppointmentStatusCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentStatusCode](
	[AppointmentStatusCodeId] [int]  NOT NULL,
	[AppointmentStatusCodeName] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_AppointmentStatusCodeId] PRIMARY KEY CLUSTERED 
(
	[AppointmentStatusCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
