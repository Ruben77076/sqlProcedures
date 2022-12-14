USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_BatchUpdate]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_BatchUpdate]
			@batchSkills dbo.SkillsUDT READONLY
			,@batchFriends dbo.FriendsUDT_BatchUpdate READONLY
			,@batchImages dbo.ImagesUDT READONLY
			,@Id int

	/*
		---Declare @Title nvarchar(120)=
				,@Bio nvarchar(700)=
				,@Summary nvarchar(255)=
				,@Headline nvarchar(80)=
				,@Slug nvarchar(100)=
				,@StatusId int=1
				,@UserId int= 256

		
		
		
int = 1
,@TypeId int=2
,@Url nvarchar(max)=
		
	--------------	
		
		Declare @Id int = 1177;
		Declare @newFriends dbo.FriendsUDT_BatchUpdate;


		Insert into @newFriends (Id
								,Title
								,Bio
								,Summary
								,Headline
								,Slug
								,StatusId
								,UserId
								,PrimaryImageId
								,DateModified
								)
		Values(1177,'El Ruben'
				,' a title of various official positions in the governments of many nations. The original chancellors were the cancellarii of Roman courts of justice—ushers, who sat at the cancelli or lattice work screens of a basilica or law court, which separated the judge and counsel from the audience. '
				,'El Ruben'
				,'El Larry is actually a Sith Lord!'
				,'pres'
				,1
				,256
				,1
				,getutcdate())

		Declare @newImages dbo.ImagesUDT;
				
		Insert into @newImages(Id,TypeId,Url)
		Values (1,2,'https://images.unsplash.com/photo-1431347602106-1608ccc66b67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwxfHxjaGFuY2VsbG9yfGVufDB8fHx8MTY2MjAwMDQxMg&ixlib=rb-1.2.1&q=80&w=1080')

		Declare @batchSkills dbo.SkillsUDT;


		Insert into @batchSkills(Name)
		Values ('Windows XP')
		Insert into @batchSkills(Name)
		Values ('guns')
		Insert into @batchSkills(Name)
		Values ('lasers')

		 
		Execute dbo.Friends_BatchUpdate
				@batchSkills
				,@newFriends
				,@newImages
				,@Id

	
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
		
			--Declare @PrimaryImageId int
		
			--Update dbo.Images 
			--Set TypeId= i.TypeId
			--	,Url = i.Url
			--from @batchImages as i inner join dbo.Images as bi
			--on bi.Id = i.Id
			--where bi.Id = i.Id

		--SET @PrimaryImageId = SCOPE_IDENTITY()

			
			Declare @todayDate datetime2 = getutcdate();

			Update dbo.FriendsV2
			SET	[Title]= f.Title
				,[Bio]= f.Bio
				,[Summary]=f.Summary
				,[Headline]=f.Headline
				,[Slug]=f.Slug
				,[StatusId]=f.StatusId
				,[UserId]=f.UserId
				,[PrimaryImageId]=f.PrimaryImageId
				,[DateModified]=@todayDate
			from @batchFriends as f 
			inner join FriendsV2 as a
			on a.Id= f.Id  
			
			Update dbo.Images
			SET [TypeId] = i.TypeId
				,[Url] = i.Url 
			from @batchImages as i
			inner join Images as b
			on b.Id = i.Id
				
			Update dbo.Skills
			SET [Name] = s.Name
			from @batchSkills as s
			Where Not Exists (Select 1
							  From dbo.Skills as c
							  Where s.Name = c.Name)

			Update dbo.FriendSkills
			SET [FriendId] = @Id
				,[SkillId] = c.Id
			From dbo.Skills as c
			Where Exists (Select 1
						  From @batchSkills as s
						  Where c.Name = s.Name)

			
			--Insert into dbo.Skills(Name)
			--Select   n.Name
			--From @batchSkills as n
			--Where Not Exists (Select 1
			--				  From dbo.Skills as s
			--				  Where n.Name = s.Name)

			--Insert into dbo.FriendSkills(FriendId,SkillId)

			--Select @Id
			--		,s.Id

			--From dbo.Skills as s
			--Where Exists (Select 1
			--			  From @batchSkills as n
			--			  Where s.Name = n.Name)
	END
GO
