USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectAllV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Friends_SelectAllV2]
				
	/*
	

	Execute dbo.Friends_SelectAllV2 
	*/
	as
	BEGIN
	
SELECT [Id]
      ,[Title]
      ,[Bio]
      ,[Summary]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
      ,[PrimaryImageId]
      ,[DateCreated]
      ,[DateModified]
      ,[UserId]
  FROM [dbo].[FriendsV2]
  




	END
GO
