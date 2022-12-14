USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Batch]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





		CREATE proc [dbo].[Friends_Batch]
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
		
		

		Declare @Title nvarchar(120)='La Presidente'
				,@Bio nvarchar(700)=' a title of various official positions in the governments of many nations. The original chancellors were the cancellarii of Roman courts of justice—ushers, who sat at the cancelli or lattice work screens of a basilica or law court, which separated the judge and counsel from the audience. '
				,@Summary nvarchar(255)='La Presidente'
				,@Headline nvarchar(80)='El Presidente is actually a Sith Lord!'
				,@Slug nvarchar(100)='pres'
				,@StatusId int=1
				,@ImageTypeId int=2
				,@ImageUrl nvarchar(max)='https://images.unsplash.com/photo-1431347602106-1608ccc66b67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwxfHxjaGFuY2VsbG9yfGVufDB8fHx8MTY2MjAwMDQxMg&ixlib=rb-1.2.1&q=80&w=1080'
				,@UserId int= 256
				,@Id int =0
				
		Declare @batchSkills dbo.SkillsUDT;



		Insert into @batchSkills(Name)
		Values ('Muy Thai')
		Insert into @batchSkills(Name)
		Values ('guns')
		Insert into @batchSkills(Name)
		Values ('skateboard')

		 

		
		Execute dbo.Friends_Batch
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

		Select *
		from dbo.Images

		Select *
		from dbo.FriendSkills

		Select *
		from dbo.FriendsV2

		*/

		
as
		BEGIN 

			Declare @PrimaryImageId int
		
			Insert into dbo.Images ([TypeId],[Url])
			Values (@ImageTypeId,@ImageUrl)

		SET @PrimaryImageId = SCOPE_IDENTITY()

			--Declare @FriendId int

			Insert into dbo.FriendsV2
				([Title]
				,[Bio]
				,[Summary]
				,[Headline]
				,[Slug]
				,[StatusId]
				,[PrimaryImageId]
				,[UserId])
				--


			Values
				(@Title
				,@Bio
				,@Summary
				,@Headline
				,@Slug
				,@StatusId
				,@PrimaryImageId
				,@UserId)
				--

		SET @Id = SCOPE_IDENTITY() ---friendId of the insert
		
			
			Insert into dbo.Skills(Name)
			Select   n.Name
			From @batchSkills as n
			Where Not Exists (Select 1
							  From dbo.Skills as s
							  Where n.Name = s.Name)

			Insert into dbo.FriendSkills(FriendId,SkillId)

			Select @Id
					,s.Id

			From dbo.Skills as s
			Where Exists (Select 1
						  From @batchSkills as n
						  Where s.Name = n.Name)
			
		
		END



GO
