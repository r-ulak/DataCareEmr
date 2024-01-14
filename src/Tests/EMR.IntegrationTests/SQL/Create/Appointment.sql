/****** Object:  Table [dbo].[Appointment]     ******/
IF OBJECT_ID('dbo.Appointment', 'U') IS NOT NULL 
	DROP TABLE [dbo].[Appointment]
SET ANSI_NULLS ON

CREATE TABLE [dbo].[Appointment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [int]  NULL,	
	[TenantId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[AppointmentCodeId] [int] NOT NULL,
	[AppointmentStatusCodeId] [int] NOT NULL,
	[AllDayEvent] bit NOT NULL,
	[StartDate] [datetime2](0) NOT NULL,
	[EndDate] [datetime2](0) NOT NULL,	
	[Title] [nvarchar](255) NOT NULL,
	[AdministrationSiteId] [int] NULL,
	[Fname] [nvarchar](50)  NULL,
	[Lname] [nvarchar](50)  NULL,
	[Mname] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[PhoneCell] [nvarchar](20) NULL,
	[PhoneHome] [nvarchar](20) NULL,
	[Note] [nvarchar](max) NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	INDEX IX_ProviderId NONCLUSTERED (ProviderId),
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),	
	CONSTRAINT [PK_Appointment_Id] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)  

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


