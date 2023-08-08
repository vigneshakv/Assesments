CREATE   PROCEDURE InsertEmployee    
(    
@EmployeeName NVARCHAR(128),    
@EmployeeDOB DATETIME,    
@Gender INT,    
@Address NVARCHAR(MAX),    
@State INT,    
@City INT,    
@CreatedDate DATETIME
)    
AS    
BEGIN;    
 INSERT INTO [dbo].[Employee]    
      ([EmployeeName],[EmployeeDOB],[Gender]    
      ,[Address],[State],[City]    
      ,[CreatedDate])    
 OUTPUT inserted.EmployeeId  
 VALUES    
      (@EmployeeName,@EmployeeDOB,@Gender    
      ,@Address,@State,@City    
      ,@CreatedDate)    
END;