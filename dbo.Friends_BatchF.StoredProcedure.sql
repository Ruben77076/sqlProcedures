USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_BatchF]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		CREATE proc [dbo].[Friends_BatchF]
					@batchFriends dbo.FriendsUDT READONLY
		/*
		Declare @myFriends as FriendsUDT
		

		Insert into @myFriends(Id
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
		Values (200,'Caesar','As the United Nations Secretary General’s Envoy on Youth, I know there’s no better resource in times of trouble than young people. Yes, we need scientific breakthroughs, action by governments and a massive amount of financing, but we also need the kind of initiative and resourcefulness that motivate the world’s outstanding youth.',
				'Caesar','UN Envoy','cr',1,253,2,getutcdate(),getutcdate())

		Insert into @myFriends(Id
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
		Values (201,'Caliph','As the United Nations Secretary General’s Envoy on Youth, I know there’s no better resource in times of trouble than young people. Yes, we need scientific breakthroughs, action by governments and a massive amount of financing, but we also need the kind of initiative and resourcefulness that motivate the world’s outstanding youth.',
				'Caliph','UN Envoy','ch',1,254,2,getutcdate(),getutcdate())

		Execute dbo.Friends_BatchF @myFriends

		Select *
		from dbo.FriendsV2


		*/
		as
		BEGIN
	--Declare @datenow datetime2 =getutcdate()
		
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

		END
GO
