USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_Pagination]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Friends_Search_Pagination]
			(@PageIndex int
			 ,@PageSize int
			 ,@Query nvarchar (100))

/*
		Declare @PageSize int;
		Declare @PageIndex int;
		Declare @Query nvarchar(100);
		Set @PageIndex =0;
		Set @PageSize = 20;
		Set @Query = 'is%'

		Execute dbo.Friends_Search_Pagination @PageIndex,@PageSize,@Query

		Select *
		from dbo.Friends

*/

as 
BEGIN
Declare @offset int= @PageIndex * @PageSize

		SELECT [Id]
			  ,[Title]
			  ,[Bio]
			  ,[Summary]
			  ,[UserId]
			  ,[Headline]
			  ,[Slug]
			  ,[StatusId]
			  ,[PrimaryImageUrl]
			  ,[DateCreated]
			  ,[DateModified]
			  ,TotalCount= COUNT(1) OVER()
		  FROM [dbo].[Friends]
		  Where (Title LIKE '%' + @Query OR
				 Bio LIKE '%' + @Query OR
				 Summary LIKE '%' + @Query OR
				 Headline LIKE '%' + @Query OR
				 Slug LIKE '%' + @Query OR
				 UserId LIKE '%' + @Query)

		   ORDER BY Id
				OFFSET @offset Rows
				Fetch Next @PageSize Rows Only


END
GO
