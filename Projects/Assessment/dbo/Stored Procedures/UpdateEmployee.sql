CREATE PROCEDURE UpdateEmployee
(
@EmployeeId INT,
@EmployeeName NVARCHAR(128),
@EmployeeDOB DATETIME,
@Gender INT,
@Address NVARCHAR(MAX),
@State INT,
@City INT,
@ModifiedDate DATETIME,
@IsActive BIT
)
AS
BEGIN;
	UPDATE [dbo].[Employee]
	SET [EmployeeName] = @EmployeeName
		,[EmployeeDOB] = @EmployeeDOB
		,[Gender] = @Gender
		,[Address] = @Address
		,[State] = @State
		,[City] = @City
		,[IsActive] = @IsActive
		,[ModifiedDate] = @ModifiedDate
	WHERE employeeid = @EmployeeId
END;