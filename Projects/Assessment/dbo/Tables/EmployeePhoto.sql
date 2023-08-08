CREATE TABLE [dbo].[EmployeePhoto] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [EmployeeId]   INT             NOT NULL,
    [Photo]        VARBINARY (MAX) NULL,
    [CreatedDate]  DATETIME        NOT NULL,
    [IsActive]     BIT             CONSTRAINT [DF_EmployeePhoto_IsActive] DEFAULT ((1)) NULL,
    [ModifiedDate] DATETIME        NULL,
    CONSTRAINT [PK_EmployeePhoto] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EmployeePhoto_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

