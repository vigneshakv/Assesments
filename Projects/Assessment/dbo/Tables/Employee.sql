CREATE TABLE [dbo].[Employee] (
    [EmployeeId]   INT            IDENTITY (1, 1) NOT NULL,
    [EmployeeName] NVARCHAR (128) NOT NULL,
    [EmployeeDOB]  DATETIME       NOT NULL,
    [Gender]       INT            NOT NULL,
    [Address]      NVARCHAR (MAX) NULL,
    [State]        INT            NOT NULL,
    [City]         INT            NOT NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [IsActive]     BIT            CONSTRAINT [DF_Employee_IsActive] DEFAULT ((1)) NULL,
    [ModifiedDate] DATETIME       NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeId] ASC)
);

