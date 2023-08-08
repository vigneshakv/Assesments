CREATE PROCEDURE GetHobbies
AS
BEGIN;
	SELECT [Id]
		  ,[Name]
  FROM [dbo].[Hobbies]
END;