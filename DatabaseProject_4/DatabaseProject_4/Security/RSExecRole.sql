CREATE ROLE [RSExecRole]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'RSExecRole', @membername = N'NT AUTHORITY\NETWORK SERVICE';

