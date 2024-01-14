/****** Object:  Table [dbo].[AppointmentCode]     ******/
IF OBJECT_ID('dbo.AppointmentCode', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AppointmentCode]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentCode](
	[AppointmentCodeId] [int]  NOT NULL,
	[AppointmentCodeName] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_AppointmentCodeId] PRIMARY KEY CLUSTERED 
(
	[AppointmentCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
