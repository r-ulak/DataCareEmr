
/****** Object:  Table [dbo].[PatientVital]     ******/
IF OBJECT_ID('dbo.PatientVital', 'U') IS NOT NULL 
	DROP TABLE [dbo].[PatientVital]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientVital](
	[VitalId] [bigint] IDENTITY(1,1) NOT NULL,
	[VisitId] [bigint]  NOT NULL,
	[TenantId] [int] NOT NULL,
	[CreateDate] [datetime2](0) NOT NULL,
	[CreatedBy] [bigint] NOT NULL ,
	[Pid] [bigint] NOT NULL,	
	[Bps] [numeric](5, 2) NULL,
	[Bpd] [numeric](5, 2) NULL,
	[Weight] [numeric](5, 2) NULL,
	[Height] [numeric](5, 2) NULL,
	[Temperature] [numeric](5, 2) NULL,
	[TempMethod] [nvarchar](255) NULL,
	[Pulse] [numeric](5, 2) NULL,
	[Respiration] [numeric](5, 2) NULL,
	[BMI] [numeric](4, 1) NULL,
	[BMIStatus] [nvarchar](255) NULL,
	[WaistCirc] [numeric](5, 2) NULL,
	[HeadCirc] [numeric](4, 2) NULL,
	[OxygenSaturation] [numeric](5, 2) NULL,
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_VisitId NONCLUSTERED (VisitId),
 CONSTRAINT [PK_PatientVital_Id] PRIMARY KEY CLUSTERED 
(
	[VitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT (NULL) FOR [Bps]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT (NULL) FOR [Bpd]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [Weight]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [Height]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [Temperature]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT (NULL) FOR [TempMethod]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [Pulse]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [Respiration]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.0)) FOR [BMI]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT (NULL) FOR [BMIStatus]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [WaistCirc]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [HeadCirc]
GO
ALTER TABLE [dbo].[PatientVital] ADD  DEFAULT ((0.00)) FOR [OxygenSaturation]
