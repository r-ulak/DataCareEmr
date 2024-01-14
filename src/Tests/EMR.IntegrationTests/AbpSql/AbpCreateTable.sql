SET nocount ON
IF OBJECT_ID('dbo.AbpAuditLogs', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AbpAuditLogs]

CREATE TABLE [dbo].[AbpAuditLogs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
	[ServiceName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[Parameters] [nvarchar](1024) NULL,
	[ExecutionTime] [datetime] NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[BrowserInfo] [nvarchar](256) NULL,
	[Exception] [nvarchar](2000) NULL,
	[ImpersonatorUserId] [bigint] NULL,
	[ImpersonatorTenantId] [int] NULL,
	[CustomData] [nvarchar](2000) NULL,
 CONSTRAINT [PK_dbo.AbpAuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

IF OBJECT_ID('dbo.AbpUsers', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AbpUsers]
CREATE TABLE [dbo].[AbpUsers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[AuthenticationSource] [nvarchar](64) NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Surname] [nvarchar](32) NOT NULL,
	[UserName] [nvarchar](32) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
	[EmailConfirmationCode] [nvarchar](128) NULL,
	[PasswordResetCode] [nvarchar](328) NULL,
	[LastLoginTime] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[AccessFailedCount] [int] NOT NULL,
	[IsLockoutEnabled] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[IsPhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[IsTwoFactorEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AbpUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

IF OBJECT_ID('dbo.AbpPermissions', 'U') IS NOT NULL 
	DROP TABLE [dbo].AbpPermissions

CREATE TABLE [dbo].[AbpPermissions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[IsGranted] [bit] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[RoleId] [int] NULL,
	[UserId] [bigint] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_dbo.AbpPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
IF OBJECT_ID('dbo.AbpRoles', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AbpRoles]
CREATE TABLE [dbo].[AbpRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](32) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[IsStatic] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
IF OBJECT_ID('dbo.AbpUserRoles', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AbpUserRoles]
CREATE TABLE [dbo].[AbpUserRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_dbo.AbpUserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

IF OBJECT_ID('dbo.AbpSettings', 'U') IS NOT NULL 
	DROP TABLE [dbo].[AbpSettings]
CREATE TABLE [dbo].[AbpSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [nvarchar](2000) NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]