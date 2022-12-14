USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_Pagination]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Users_Pagination]
						(@PageIndex int 
						,@PageSize int) 

	/*
	
	Declare @PageSize int;
	Declare @PageIndex int;
	SET @PageIndex =0;
	SET @PageSize =10;
			
			
			

	Execute dbo.Users_Pagination @PageIndex ,@PageSize 


	*/

	as
	BEGIN
	Declare @offset int = @PageIndex * @PageSize


		SELECT [Id]
			  ,[FirstName]
			  ,[LastName]
			  ,[Email]
			  ,[Password]
			  ,[AvatarUrl]
			  ,[TenantId]
			  ,[DateCreated]
			  ,[DateModified]
		  FROM [dbo].[Users]

		  ORDER BY Id

			  OFFSET @offset Rows
			  Fetch Next @PageSize Rows Only
	
	END
GO
