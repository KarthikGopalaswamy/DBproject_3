CREATE TABLE [dbo].[SessionData] (
    [SessionID]              VARCHAR (32)     NOT NULL,
    [CompiledDefinition]     UNIQUEIDENTIFIER NULL,
    [SnapshotDataID]         UNIQUEIDENTIFIER NULL,
    [IsPermanentSnapshot]    BIT              NULL,
    [ReportPath]             NVARCHAR (424)   NULL,
    [Timeout]                INT              NOT NULL,
    [AutoRefreshSeconds]     INT              NULL,
    [Expiration]             DATETIME         NOT NULL,
    [ShowHideInfo]           IMAGE            NULL,
    [DataSourceInfo]         IMAGE            NULL,
    [OwnerID]                UNIQUEIDENTIFIER NOT NULL,
    [EffectiveParams]        NTEXT            NULL,
    [CreationTime]           DATETIME         NOT NULL,
    [HasInteractivity]       BIT              NULL,
    [SnapshotExpirationDate] DATETIME         NULL,
    [HistoryDate]            DATETIME         NULL,
    [PageHeight]             FLOAT (53)       NULL,
    [PageWidth]              FLOAT (53)       NULL,
    [TopMargin]              FLOAT (53)       NULL,
    [BottomMargin]           FLOAT (53)       NULL,
    [LeftMargin]             FLOAT (53)       NULL,
    [RightMargin]            FLOAT (53)       NULL,
    [AwaitingFirstExecution] BIT              NULL
);


GO
EXECUTE sp_tableoption @TableNamePattern = N'[dbo].[SessionData]', @OptionName = N'text in row', @OptionValue = N'256';


GO
CREATE UNIQUE CLUSTERED INDEX [IDX_SessionData]
    ON [dbo].[SessionData]([SessionID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SessionCleanup]
    ON [dbo].[SessionData]([Expiration] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SessionSnapshotID]
    ON [dbo].[SessionData]([SnapshotDataID] ASC);

