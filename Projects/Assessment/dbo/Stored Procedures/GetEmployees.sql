CREATE PROCEDURE GetEmployees
AS
BEGIN;
SELECT [EmployeeId]
      ,[EmployeeName]
      ,[EmployeeDOB]
      ,[State]
      ,[City]
  FROM [dbo].[Employee] WHERE IsActive = 1
END;