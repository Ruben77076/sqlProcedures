USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_UpdateV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Friends_UpdateV2]
				@Title nvarchar(120)
				,@Bio nvarchar(700)
				,@Summary nvarchar(255)
				,@Headline nvarchar(80)
				,@Slug nvarchar(100)
				,@StatusId int
				,@PrimaryImageId int
				,@UserId int
				,@Id int

	/*
	Declare @Id int= 1;

	Declare @Title nvarchar(120)='Primero'
				,@Bio nvarchar(700)='Uno'
				,@Summary nvarchar(255)='First'
				,@Headline nvarchar(80)='Un'
				,@Slug nvarchar(100)='uno'
				,@StatusId int=1
				,@PrimaryImageId int=1
				,@UserId int=100


	Select *
	from dbo.FriendsV2
	Where Id = @id;

	Execute dbo.Friends_UpdateV2
			@Title
			,@Bio
			,@Summary
			,@Headline
			,@Slug
			,@StatusId
			,@PrimaryImageId
			,@UserId
			,@Id
	
	Select *
	from dbo.FriendsV2
	Where Id = @id;

	*/

	as
	BEGIN
	
Declare @todayDate datetime2 = getutcdate();

UPDATE [dbo].[FriendsV2]
   SET [Title] = @Title
      ,[Bio] = @Bio
      ,[Summary] = @Summary
      ,[Headline] = @Headline
      ,[Slug] = @Slug
      ,[StatusId] = @StatusId
      ,[PrimaryImageId] = @PrimaryImageId
      ,[DateModified] = @todayDate
      ,[UserId] = @UserId
 WHERE Id=@id;



	END
GO
