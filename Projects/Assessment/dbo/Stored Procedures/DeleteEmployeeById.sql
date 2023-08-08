CREATE PROCEDURE DeleteEmployeeById
(
@Id INT
)
AS
BEGIN;
	DELETE FROM dbo.EmployeeHobbies WHERE EmployeeId = @Id;

	DELETE FROM [dbo].[EmployeePhoto] WHERE EmployeeId = @Id;

	DELETE FROM [dbo].[Employee] WHERE EmployeeId = @Id;
END;