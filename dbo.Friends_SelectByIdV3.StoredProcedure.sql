USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV3]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



	CREATE proc [dbo].[Friends_SelectByIdV3]
				@Id int

	/*
	Declare @Id int = 1179;

	Execute dbo.Friends_SelectByIdV3 @Id

	Select f.Id
			,f.Title
			,f.Bio
			,f.Summary
			,f.Headline
			,f.Slug
			,f.StatusId
			,Skills=(
					select s.Name as Name
					from dbo.Skills s inner join dbo.FriendSkills fs
					on fs.SkillId = s.Id
					where fs.FriendId = f.Id
					for JSON AUTO
			)
			,i.Id
			,i.Url
			,i.TypeId
			,f.UserId
			,f.DateCreated
			,f.DateModified
	from dbo.FriendsV2 as f inner join dbo.Images as i
		on f.PrimaryImageId = i.Id


	*/

	as
	BEGIN
	

	Select f.Id
			,f.Title
			,f.Bio
			,f.Summary
			,f.Headline
			,f.Slug
			,f.StatusId
			,i.Id
			,i.Url
			,i.TypeId
			,f.UserId
			,f.DateCreated
			,f.DateModified
			,Skills=(
					select s.Name as Name
					from dbo.Skills s inner join dbo.FriendSkills fs
					on fs.SkillId = s.Id
					where fs.FriendId = f.Id
					for JSON AUTO
			)
	from [dbo].[FriendsV2] as f inner join [dbo].[Images] as i
			on f.PrimaryImageId = i.Id
			
	where f.Id=@id;
	
	
	END
GO
