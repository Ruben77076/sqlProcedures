USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Friends_Insert]
		
		@Title nvarchar(120)
		,@Bio nvarchar(700)
		,@Summary nvarchar(255)
		,@Headline nvarchar(80)
		,@Slug nvarchar(100)
		,@StatusId int 
		,@PrimaryImageUrl nvarchar(max)
		,@UserId int
		,@Id int OUTPUT


/* -----Test Code----

Declare @Id int = 0;

Declare @Title nvarchar(120)='Archduke'
		,@Bio nvarchar(700)='Maybe something happened and everything is missing'
		,@Summary nvarchar(255)='Archduke'
		,@Headline nvarchar(80)='From Wikipedia,the free encyclopedia'
		,@Slug nvarchar(100)='dead'
		,@StatusId int =1
		,@PrimaryImageUrl nvarchar(max)='https://upload.wikimedia.org/wikipedia/en/f/f1/Reel2RealILikeToMoveItCDSingleCover.jpg'
		,@UserId int=111

	Execute dbo.Friends_Insert
		@Title
		,@Bio 
		,@Summary 
		,@Headline 
		,@Slug 
		,@StatusId 
		,@PrimaryImageUrl 
		,@UserId 
		,@Id OUTPUT

	Select @Id

	Select *
	from dbo.Friends
	Where Id = @Id

	Select *
	from dbo.Friends


*/
as

BEGIN


INSERT INTO [dbo].[Friends]
           ([Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[StatusId]
           ,[PrimaryImageUrl]
           ,[UserId])
     VALUES
           (@Title
           ,@Bio
           ,@Summary
           ,@Headline
           ,@Slug
           ,@StatusId
           ,@PrimaryImageUrl
           ,@UserId)

	SET @Id = SCOPE_IDENTITY()

	
END


GO
