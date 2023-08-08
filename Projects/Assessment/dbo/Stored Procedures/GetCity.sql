CREATE PROCEDURE GetCity
(
@StateId INT NULL = NULL
)
AS
BEGIN;
	SELECT [Id]
		  ,[Name]
  FROM [dbo].[City] WHERE StateId = ISNULL(@StateId, StateId)
END;