USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectById]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE proc [dbo].[Users_SelectById]
				@Id int

/*
Declare @Id int=4;

Execute dbo.Users_SelectById @Id

Select *
from dbo.Users

*/

as
BEGIN
		SELECT [Id]
			  ,[FirstName]
			  ,[LastName]
			  ,[Email]
			  ,[AvatarUrl]
			  ,[TenantId]
			  ,[DateCreated]
			  ,[DateModified]
		  FROM [dbo].[Users]
		  Where Id=@Id;
END
GO
