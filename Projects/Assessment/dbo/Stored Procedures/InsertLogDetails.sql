CREATE   PROCEDURE InsertLogDetails  
(  
@LogLevel NVARCHAR(50),  
@Message NVARCHAR(MAX),  
@InputParameters NVARCHAR(MAX) = NULL,  
@Exception NVARCHAR(MAX) = NULL,  
@CreatedDate DATETIME  
)  
AS  
BEGIN;  
INSERT INTO [dbo].[Logs]  
           ([LogLevel]  
           ,[Message]  
           ,[InputParameters]  
           ,[Exception]  
           ,[CreatedDate])  
     VALUES  
           (@LogLevel  
           ,@Message  
           ,@InputParameters  
           ,@Exception  
           ,@CreatedDate)  
END;