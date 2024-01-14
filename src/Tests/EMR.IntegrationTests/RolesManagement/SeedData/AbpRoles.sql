SET nocount ON

INSERT INTO [dbo].[abproles]
            ([tenantid],[name],[displayname],[isstatic],[isdefault],[isdeleted],
             [deleteruserid],[deletiontime],[lastmodificationtime],
             [lastmodifieruserid],[creationtime],[creatoruserid])
VALUES      (1,'RoleName0','RoleName0',0,0,0,0,NULL,'4/19/2016',0,'4/19/2016',0)

INSERT INTO [dbo].[abproles]
            ([tenantid],[name],[displayname],[isstatic],[isdefault],[isdeleted],
             [deleteruserid],[deletiontime],[lastmodificationtime],
             [lastmodifieruserid],[creationtime],[creatoruserid])
VALUES      (1,'RoleName1','RoleNameDisplay2',0,0,0,0,NULL,'4/19/2016',0,'4/19/2016',0)

INSERT INTO [dbo].[abproles]
            ([tenantid],[name],[displayname],[isstatic],[isdefault],[isdeleted],
             [deleteruserid],[deletiontime],[lastmodificationtime],
             [lastmodifieruserid],[creationtime],[creatoruserid])
VALUES      (2,'RoleName','RoleNameDisplay3',0,0,0,0,NULL,'4/19/2016',0,'4/19/2016',0)
