USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_UpdateBatchShantay]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





		CREATE proc [dbo].[Friends_UpdateBatchShantay]
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
		
		Declare @Id int = 2159;

		Declare @Title nvarchar(120)='El Ezera'
				,@Bio nvarchar(700)=' a title of various official positions in the governments of many nations. The original chancellors were the cancellarii of Roman courts of justice—ushers, who sat at the cancelli or lattice work screens of a basilica or law court, which separated the judge and counsel from the audience. '
				,@Summary nvarchar(255)='El Ezera'
				,@Headline nvarchar(80)='El Ezera is actually a Sith Lord!'
				,@Slug nvarchar(100)='ezr'
				,@StatusId int=1
				,@ImageTypeId int=2
				,@ImageUrl nvarchar(max)='https://images.unsplash.com/photo-1431347602106-1608ccc66b67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwxfHxjaGFuY2VsbG9yfGVufDB8fHx8MTY2MjAwMDQxMg&ixlib=rb-1.2.1&q=80&w=1080'
				,@UserId int= 256
				
				
		Declare @batchSkills dbo.SkillsUDT;



		Insert into @batchSkills(Name)
		Values ('Windows XP')
		Insert into @batchSkills(Name)
		Values ('submarines')
		Insert into @batchSkills(Name)
		Values ('lasers')

		 

		
		Execute [dbo].[Friends_UpdateBatchShantay]
				@batchSkills
				,@Title 
				,@Bio
				,@Summary
				,@Headline
				,@Slug
				,@StatusId
				,@ImageTypeId
				,@ImageUrl
				,@UserId
				,@Id 
				

		Select *
		from dbo.Skills

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
				--,[PrimaryImageId]=@PrimaryImageId

		
			
			Update dbo.Images 
			SET  TypeId=@ImageTypeId
				,Url=@ImageUrl

		

			Update dbo.FriendsV2
			SET	[Title] = @Title
				,[Bio]=@Bio
				,[Summary]=@Summary
				,[Headline]=@Headline
				,[Slug]=@Slug
				,[StatusId]=@StatusId
				,[UserId]=@UserId
			where Id= @Id;

			Update dbo.Skills
			SET   Name= n.Name
			From @batchSkills as n
			inner join dbo.Skills as s
			on s.Name = n.Name
			

			Update dbo.FriendSkills
			SET FriendId=  (Select fs.FriendId
							From FriendSkills as fs
							inner join dbo.Skills as s
							on s.Id = fs.SkillId
							)
			Where EXISTS (Select s.Name
						  From Skills as s
						  inner join dbo.FriendSkills as fs
						  on fs.SkillId = s.Name);

			--Insert into dbo.Skills(Name)
			--Select   n.Name
			--From @batchSkills as n
			--Where Not Exists (Select 1
			--				  From dbo.Skills as s
			--				  Where n.Name = s.Name)
			
			
			
			--Insert into dbo.FriendSkills(FriendId,SkillId)
			--Select @Id,s.Id
			--From dbo.Skills as s
			--Where Exists (Select 1
			--			  From @batchSkills as n
			--			  Where s.Name = n.Name)
			
			--Update dbo.Skills
			--SET   Name= n.Name
			--From @batchSkills as n
			--inner join dbo.Skills as s
			--on s.Name = n.Name
			

			--Update dbo.FriendSkills
			--SET FriendId=  @Id
			--Where FriendId = @Id
			
		
		END



GO
