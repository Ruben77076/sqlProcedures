USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Friends_SelectByIdV2]
					@Id int
	/*
	Declare @Id int = 10;

	Execute dbo.Friends_SelectByIdV2 @Id

	Select *
	from dbo.FriendsV2 as f inner join dbo.Images as i
		on f.PrimaryImageId = i.Id

	*/
	as
	BEGIN
	
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
      ,[DateCreated]
      ,[DateModified]
  FROM [dbo].[FriendsV2] as f inner join dbo.Images as i
	on f.PrimaryImageId = i.Id
  Where f.Id=@id;




	END
GO
