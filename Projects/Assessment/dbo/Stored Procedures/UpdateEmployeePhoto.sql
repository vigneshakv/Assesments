CREATE   PROCEDURE UpdateEmployeePhoto  
(  
@Id INT,  
@Photo VARBINARY(MAX) NULL = NULL,  
@ModifiedDate DATETIME,  
@IsActive BIT  
)  
AS  
BEGIN;  
 UPDATE [dbo].[EmployeePhoto]  
 SET [Photo] = @Photo  
  ,[IsActive] = @IsActive  
  ,[ModifiedDate] = @ModifiedDate  
 WHERE Id = @Id  
END;