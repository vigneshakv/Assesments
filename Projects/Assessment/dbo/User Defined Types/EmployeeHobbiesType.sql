CREATE TYPE [dbo].[EmployeeHobbiesType] AS TABLE (
    [Id]           INT      NULL,
    [EmployeeId]   INT      NULL,
    [HobbyId]      INT      NULL,
    [CreatedDate]  DATETIME NULL,
    [IsActive]     BIT      NULL,
    [ModifiedDate] DATETIME NULL);

