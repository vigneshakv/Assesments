﻿CREATE TABLE [dbo].[State] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_State_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

