USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Batch_Update]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----only Skills uses UDT

CREATE proc [dbo].[Friends_Batch_Update]
			@batchSkills dbo.SkillsUDT READONLY
			,@Title nvarchar(120)
			,@Bio nvarchar(700)
			,@Summary nvarchar(255)
			,@Headline nvarchar(80)
			,@Slug nvarchar(100)
			,@StatusId int
			,@ImageTypeId int
			,@ImageUrl nvarchar(max)
			,@UserId int
			,@Id int OUTPUT
/*
	Declare @batchSkills dbo.SkillsUDT;
		Update @batchSkills
			('Muy Thai')



	Declare @Id int = 1145;

	Declare @Title nvarchar(120)='El Boss'
			,@Bio nvarchar(700)='Nemesio Oseguera Cervantes commonly referred to by his alias El Mencho is a Mexican drug lord and leader of the Jalisco New Generation Cartel'
			,@Summary nvarchar(255)='El Boss'
			,@Headline nvarchar(80)='El Boss is actually a Sith Lord!'
			,@Slug nvarchar(100)='elb'
			,@StatusId int=1
			,@ImageTypeId int=1
			,@ImageUrl nvarchar(max)='https://images.unsplash.com/photo-1620485435764-ba7b5ea3804f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwzfHxlbCUyMGJvc3N8ZW58MHx8fHwxNjYzNjQ4MDk2&ixlib=rb-1.2.1&q=80&w=1080'
			,@UserId int=300

		

    
	Select *
		from dbo.FriendsV2
		where Id = @Id;

	Execute dbo.Friends_Batch_Update
				@batchSkills
				,@Title
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
		where Id = @Id;

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
			,Skills=(
					select s.Name as Name
					from dbo.Skills s inner join dbo.FriendSkills fs
					on fs.SkillId = s.Id
					where fs.FriendId = f.Id
					for JSON AUTO
			)
			,f.UserId
			,f.DateCreated
			,f.DateModified
	from dbo.FriendsV2 as f inner join dbo.Images as i
		on f.PrimaryImageId = i.Id
	where Id = @Id;

			
			
			
*/

as
BEGIN 
		Declare @PrimaryImageId int

		UPDATE [dbo].[Images]
		SET [TypeId] = @ImageTypeId
			,[Url] = @ImageUrl
		WHERE Id = @Id;


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
		WHERE Id=@Id;

		--Update dbo.Skills
		--SET Name = n.Name
		--From @batchSkills as n
		--Where Not Exists (Select 1
		--				  From dbo.Skills as s
		--				  Where n.Name = s.Name)

		--Update dbo.FriendSkills
		--SET @Id = s.Id
			
		
		--From dbo.Skills as s
		--Where Exists (Select 1
		--			  From @batchSkills as n
		--			  Where s.Name = n.Name)




END



GO
