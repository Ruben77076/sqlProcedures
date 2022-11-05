USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE proc [dbo].[Users_SelectAll]
				
/*


Execute dbo.Users_SelectAll 

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
			
END

GO
