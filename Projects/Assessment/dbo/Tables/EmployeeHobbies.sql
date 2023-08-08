CREATE TABLE [dbo].[EmployeeHobbies] (
    [Id]           INT      IDENTITY (1, 1) NOT NULL,
    [EmployeeId]   INT      NOT NULL,
    [HobbyId]      INT      NOT NULL,
    [CreatedDate]  DATETIME NOT NULL,
    [IsActive]     BIT      CONSTRAINT [DF_EmployeeHobbies_IsActive] DEFAULT ((1)) NULL,
    [ModifiedDate] DATETIME NULL,
    CONSTRAINT [PK_EmployeeHobbies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EmployeeHobbies_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

