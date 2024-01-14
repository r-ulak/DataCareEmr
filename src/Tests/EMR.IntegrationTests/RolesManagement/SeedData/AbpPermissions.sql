SET nocount ON

INSERT INTO [dbo].[AbpPermissions]
           ([Name],[IsGranted],[CreationTime],[CreatorUserId],[RoleId],[UserId],[Discriminator],[TenantId])
     VALUES ('Permission0', 1,GetDate(),1,1,2,'',1)

INSERT INTO [dbo].[AbpPermissions]
           ([Name],[IsGranted],[CreationTime],[CreatorUserId],[RoleId],[UserId],[Discriminator],[TenantId])
     VALUES ('Permission1', 1,GetDate(),1,2,2,'',1)
INSERT INTO [dbo].[AbpPermissions]
           ([Name],[IsGranted],[CreationTime],[CreatorUserId],[RoleId],[UserId],[Discriminator],[TenantId])
     VALUES ('Permission2', 1,GetDate(),1,3,2,'',2)