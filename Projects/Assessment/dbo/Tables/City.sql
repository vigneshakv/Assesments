CREATE TABLE [dbo].[City] (
    [Id]      INT           IDENTITY (1, 1) NOT NULL,
    [Name]    NVARCHAR (50) NOT NULL,
    [StateId] INT           NOT NULL,
    CONSTRAINT [PK_City_Id] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_City_StateId] FOREIGN KEY ([StateId]) REFERENCES [dbo].[State] ([Id])
);

