CREATE TABLE [dbo].[Logs] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [LogLevel]        NVARCHAR (50)  NULL,
    [Message]         NVARCHAR (MAX) NULL,
    [InputParameters] NVARCHAR (MAX) NULL,
    [Exception]       NVARCHAR (MAX) NULL,
    [CreatedDate]     DATETIME       NULL,
    CONSTRAINT [PK_Logs_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

