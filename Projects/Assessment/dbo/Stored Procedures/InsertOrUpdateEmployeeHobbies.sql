CREATE PROCEDURE InsertOrUpdateEmployeeHobbies  
(  
@EmployeeHobbies AS dbo.EmployeeHobbiesType READONLY,
@EmployeeId INT
)  
AS  
BEGIN;  
 MERGE [dbo].[EmployeeHobbies] AS target  
 USING @EmployeeHobbies AS source  
 ON target.Id = source.Id AND target.IsActive = 1  
 WHEN MATCHED THEN  
  UPDATE SET   
   target.[HobbyId] = source.HobbyId,  
   target.[ModifiedDate] = source.ModifiedDate,  
   target.[IsActive] = source.IsActive  
 WHEN NOT MATCHED BY target THEN  
   INSERT ([EmployeeId],[HobbyId],[CreatedDate])  
   VALUES (@EmployeeId,source.HobbyId,source.CreatedDate);  
END;