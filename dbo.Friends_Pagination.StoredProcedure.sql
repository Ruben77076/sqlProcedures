USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Pagination]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



	CREATE proc [dbo].[Friends_Pagination]
				@PageIndex int=0
				,@PageSize int=10

/*
Declare @PageSize int;
Declare @PageIndex int;
SET @PageIndex =0;
SET @PageSize = 10;

Execute dbo.Friends_Pagination @PageIndex
*/

as 

BEGIN
Declare @offset int = @PageIndex * @PageSize	

		SELECT [Id]
			  ,[Title]
			  ,[Bio]
			  ,[Summary]
			  ,[Headline]
			  ,[Slug]
			  ,[StatusId]
			  ,[PrimaryImageUrl]
			  ,[DateCreated]
			  ,[DateModified]
			  ,[UserId]
			  ,TotalCount= COUNT(1) OVER()
		  FROM [dbo].[Friends]

		  ORDER BY Id

			  OFFSET @offset Rows
			  Fetch Next @PageSize Rows Only


END
GO
