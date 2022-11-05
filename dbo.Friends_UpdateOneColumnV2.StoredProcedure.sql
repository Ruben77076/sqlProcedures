USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_UpdateOneColumnV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



	CREATE proc [dbo].[Friends_UpdateOneColumnV2]
					@UserId int
					  ,@Id int
	/*
	Declare @Id int = 7
	
	
		Declare @UserId int = 206;

	Select *
	from dbo.FriendsV2
	where Id=@id

	Execute dbo.Friends_UpdateV2	
			@UserId
			,@Id

	Select *
	from dbo.FriendsV2
	where Id=@id


	*/
	as
	BEGIN
	Declare @todayDate datetime2 = getutcdate();

	UPDATE [dbo].[FriendsV2]
	   SET [DateModified] = @todayDate
		  ,[UserId] = @UserId
	 WHERE Id=@Id


	END
GO
