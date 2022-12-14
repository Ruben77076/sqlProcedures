USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_InsertV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Friends_InsertV2]
		@Title nvarchar(120)
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
	Declare @Id int = 0;

Declare @Title nvarchar(120)='Cardinal  '
		,@Bio nvarchar(700)='Appointed Person'
		,@Summary nvarchar(255)='Cardinal  '
		,@Headline nvarchar(80)='From Wikipedia,the free encyclopedia'
		,@Slug nvarchar(100)='cardinal  '
		,@StatusId int =1200
		,@ImageTypeId int =1200
		,@ImageUrl nvarchar(max)='https://images.unsplash.com/photo-1615146101981-cf25d1a1e6a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwxfHxjYXJkaW5hbHxlbnwwfHx8fDE2NjE4MjQzNzc&ixlib=rb-1.2.1&q=80&w=1080'
		,@UserId int=216

	Execute dbo.Friends_InsertV2
		@Title
		,@Bio 
		,@Summary 
		,@Headline 
		,@Slug 
		,@StatusId 
		,@ImageTypeId
		,@ImageUrl
		,@UserId 
		,@Id OUTPUT

	Select @Id

	Select *
	from dbo.FriendsV2
	Where Id = @Id

	Select *
	from dbo.FriendsV2
	SELECT f.[Id]
      ,f.[Title]
      ,f.[Bio]
      ,f.[Summary]
      ,f.[Headline]
      ,f.[Slug]
      ,f.[StatusId]
      ,i.TypeId
	  ,i.Url
	  ,f.UserId
      ,[DateCreated]
      ,[DateModified]
FROM [dbo].[FriendsV2] as f left outer join dbo.Images as i
	on f.PrimaryImageId = i.Id
  Where (f.UserId IS NULL OR f.UserId IS NOT NULL)
				

	*/
	as
	BEGIN
	
Declare @PrimaryImageId int

INSERT INTO [dbo].[Images]([TypeId],[Url])
     VALUES
           (@ImageTypeId
           ,@ImageUrl)
SET @PrimaryImageId = SCOPE_IDENTITY()

INSERT INTO [dbo].[FriendsV2] (Title,Bio,Summary,Headline,Slug,StatusId,PrimaryImageId,UserId)
	 VALUES
           (@Title,@Bio,@Summary,@Headline,@Slug,@StatusId,@PrimaryImageId,@UserId)

		   SET @Id = SCOPE_IDENTITY()
	


	END
GO
