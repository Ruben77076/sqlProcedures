USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_PaginationV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE proc [dbo].[Friends_PaginationV2]

					@PageIndex int=0
					,@PageSize int=12
	/*
	Declare @PageSize int;
	Declare @PageIndex int;
	SET @PageIndex =1;
	

	Execute dbo.Friends_PaginationV2 @PageIndex


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
  
  order by f.Id

  OFFSET @offset Rows
  Fetch Next @PageSize Rows Only




	END
GO
