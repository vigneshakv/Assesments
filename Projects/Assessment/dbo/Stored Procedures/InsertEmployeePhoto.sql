CREATE PROCEDURE InsertEmployeePhoto  
(  
@EmployeeId INT,  
@Photo VARBINARY(MAX) NULL = NULL,  
@CreatedDate DATETIME  
)  
AS  
BEGIN;  
 INSERT INTO [dbo].[EmployeePhoto]  
           ([EmployeeId]  
           ,[Photo]  
           ,[CreatedDate])  
     VALUES  
           (@EmployeeId  
           ,@Photo  
           ,@CreatedDate)  
END;