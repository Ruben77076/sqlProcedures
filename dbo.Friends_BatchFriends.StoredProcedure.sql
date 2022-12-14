USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_BatchFriends]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_BatchFriends]
			@batchFriends dbo.FriendsUDT READONLY

/*
	Declare @myFriends as dbo.FriendsUDT

	Insert into @myFriends (Id
							,Title
							,Bio
							,Summary
							,Headline
							,Slug
							,StatusId
							,UserId
							,PrimaryImageId
							,DateCreated
							,DateModified
							)
	Values (30,'Captain','Any naval officer who commands a ship is addressed by naval custom as "captain" while aboard in command, regardless of their actual rank, even though technically an officer of below the rank of captain is more correctly titled the commanding officer, or C.O. Officers with the rank of captain travelling aboard a vessel they do not command should be addressed by their rank and name','Captain','Navy captain pleads guilty at court-martial','capt',1,55,1,getutcdate(),getutcdate())

	Insert into @myFriends (Id
							,Title
							,Bio
							,Summary
							,Headline
							,Slug
							,StatusId
							,UserId
							,PrimaryImageId
							,DateCreated
							,DateModified
							)
	Values (31,'Centurion','In the Roman infantry, the centurions commanded a centuria or "century". During the Mid-Republic these centuries were grouped in pairs to make up a maniple, each century consisting of 30 - 60 men.','Centurion','Roman Centurion Movie','centrn',1,56,1,getutcdate(),getutcdate())

	Execute dbo.Friends_BatchF @myFriends

	Select *
	from dbo.FriendsV2

*/
as
BEGIN

SET IDENTITY_INSERT dbo.FriendsV2 ON
	Insert into dbo.FriendsV2 (Title
								,Bio
								,Summary
								,Headline
								,Slug
								,StatusId
								,UserId
								,PrimaryImageId
								)
	Select n.Title
			,n.Bio
			,n.Summary
			,n.Headline
			,n.Slug
			,n.StatusId
			,n.UserId
			,n.PrimaryImageId
		
	from @batchFriends as n

SET IDENTITY_INSERT dbo.FriendsV2 OFF
END
GO
