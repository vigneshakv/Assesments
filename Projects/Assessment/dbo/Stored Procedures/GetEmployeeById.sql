CREATE PROCEDURE GetEmployeeById(  
@EmployeeId INT  
)  
AS  
BEGIN;  
SELECT emp.[EmployeeId]  
      ,emp.[EmployeeName]  
      ,emp.[EmployeeDOB]  
      ,emp.[Gender]  
      ,emp.[Address]  
      ,emp.[State]  
      ,emp.[City]  
      ,emp.[CreatedDate]  
   ,emp.[ModifiedDate]  
   ,photo.Id PhotoId  
   ,photo.Photo  
   ,emph.Id EmployeeHobbyId  
   ,emph.HobbyId  
  FROM [dbo].[Employee] emp  
  INNER JOIN [dbo].[EmployeePhoto] photo on emp.EmployeeId = Photo.EmployeeId and Photo.IsActive = 1  
  LEFT JOIN [dbo].[EmployeeHobbies] emph on emp.EmployeeId = emph.EmployeeId and emph.IsActive = 1  
  WHERE emp.IsActive = 1 AND emp.EmployeeId = @EmployeeId  
END;