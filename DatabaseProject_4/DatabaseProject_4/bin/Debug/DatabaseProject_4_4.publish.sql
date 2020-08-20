﻿/*
Deployment script for targetdatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "targetdatabase"
:setvar DefaultFilePrefix "targetdatabase"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering [dbo].[ChunkData]...';


GO
ALTER TABLE [dbo].[ChunkData]
    ADD [empname] INT NULL;


GO
PRINT N'Creating [dbo].[mynewprocedure]...';


GO
CREATE PROCEDURE [dbo].[mynewprocedure]
AS
	SELECT top 100 * from ChunkData
GO
PRINT N'Refreshing [dbo].[GetDBVersion]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[GetDBVersion]';


GO
PRINT N'Update complete.';


GO
