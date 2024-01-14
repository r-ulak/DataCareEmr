IF OBJECT_ID('dbo.PatientData', 'U') IS NOT NULL 
	DROP TABLE [dbo].[PatientData]

/****** Object:  Table [dbo].[PatientData]    Script Date: 6/25/2016 3:54:52 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PatientData](
	[Pid] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,	
	[Fname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[Mname] [nvarchar](50) NOT NULL,
	[DOB] [date] NULL,
	[Street] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[City] [nvarchar](40) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
	[County] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](2) NOT NULL,
	[DriversLicense] [nvarchar](50) NOT NULL,
	[IdentificationNumber] [nvarchar](25) NOT NULL,
	[PhoneHome] [nvarchar](20) NOT NULL,
	[EmergencyContactPhone] [nvarchar](20) NOT NULL,
	[EmergencyContactName] [nvarchar](50) NOT NULL,
	[ContactRelationship] [nvarchar](20) NOT NULL,
	[PhoneCell] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](1) NOT NULL,	
	[Email] [nvarchar](50) NOT NULL,
	[Race] [nvarchar](50) NOT NULL,
	[Ethnicity] [nvarchar](50) NOT NULL,
	[BillingNote] [nvarchar](50) NULL,
	[DeceasedDate] [datetime2](0) NULL,
	[DeceasedReason] [nvarchar](350) NOT NULL,
	[CurrentlyInVisit] [bit] NOT NULL DEFAULT 0,
	[CreateDate] [datetime2](0) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,	
	INDEX IX_Pid NONCLUSTERED (Pid),
	INDEX IX_TenantId NONCLUSTERED (TenantId),
	INDEX IX_Fname NONCLUSTERED (Fname),
	INDEX IX_Mname NONCLUSTERED (Mname),
	INDEX IX_Lname NONCLUSTERED (Lname),	
	CONSTRAINT [PK_dbo.PatientData] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
  
  

SET ANSI_PADDING ON


ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Fname]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Lname]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Mname]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [DOB]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Street]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PostalCode]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [City]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [State]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [CountryCode]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [DriversLicense]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [IdentificationNumber]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PhoneHome]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PhoneCell]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [ContactRelationship]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Gender]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Email]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Race]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Ethnicity]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [DeceasedDate]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [DeceasedReason]

ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [County]
