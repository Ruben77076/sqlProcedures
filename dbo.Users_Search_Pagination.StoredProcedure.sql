USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_Search_Pagination]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



	CREATE proc [dbo].[Users_Search_Pagination]
				(@PageIndex int
				,@PageSize int
				,@Query nvarchar(100))

	/*
	
	Declare @PageSize int;
	Declare @PageIndex int;
	Declare @Query nvarchar(100)
	SET @PageIndex =0;
	SET @PageSize =10;
	Set @Query = 'Ramirez%'
			
			
			

	Execute dbo.Users_Search_Pagination @PageIndex, @PageSize,@Query 


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
			  ,TotalCount=COUNT(1) OVER()
		  FROM [dbo].[Users]
		  Where (FirstName LIKE @Query OR
				 LastName LIKE @Query)

		  ORDER BY Id

			  OFFSET @offset Rows
			  Fetch Next @PageSize Rows Only
	
	END
	


	
GO
