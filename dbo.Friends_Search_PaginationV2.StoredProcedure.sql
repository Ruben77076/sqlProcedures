USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Friends_Search_PaginationV2]
						(@PageIndex int=0
						,@PageSize int=8
						,@Query nvarchar(100))
	/*
	Declare @PageSize int;
	Declare @PageIndex int;
	Declare @Query nvarchar(100);
	SET @PageIndex=0;
	SET @PageSize = 20;
	SET @Query = 'xia%'

	Execute dbo.Friends_Search_PaginationV2 @PageIndex,@PageSize,@Query

	Select *
	from dbo.FriendsV2

	*/
	as
	BEGIN
Declare @offset int = @PageIndex * @PageSize

SELECT f.[Id]
      ,f.[Title]
      ,f.[Bio]
      ,f.[Summary]
      ,f.[Headline]
      ,f.[Slug]
      ,f.[StatusId]
	  ,i.Id
	  ,i.TypeId
	  ,i.Url
	  ,f.UserId
      ,f.[DateCreated]
      ,f.[DateModified]
      ,TotalCount= COUNT(1) OVER()
  FROM [dbo].[FriendsV2] as f inner join dbo.Images as i 
  on f.PrimaryImageId = i.Id
  Where (Title LIKE '%' + @Query OR
			Bio LIKE '%' + @Query OR
			Summary LIKE '%' + @Query OR
			Headline LIKE '%' + @Query OR
			Slug LIKE '%' + @Query OR
			UserId LIKE '%' + @Query)

	Order by f.Id

		OFFSET @offset Rows
		Fetch Next @PageSize Rows Only


	END
GO
