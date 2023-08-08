CREATE PROCEDURE GetState
AS
BEGIN;
	SELECT [Id]
		  ,[Name]
  FROM [dbo].[State]
END;