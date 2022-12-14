USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Update]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_Update]
		@Title nvarchar(120)
      ,@Bio nvarchar(700)
      ,@Summary nvarchar(255)
      ,@Headline nvarchar(80)
      ,@Slug nvarchar(100)
      ,@StatusId int
      ,@PrimaryImageUrl nvarchar(max)
      ,@UserId int
	  ,@Id int
/*
Declare @Id int=1;
	
	Declare @Title nvarchar(120)='UNO'
      ,@Bio nvarchar(700)='i am really good at playing uno'
      ,@Summary nvarchar(255)='Too good at Uno'
      ,@Headline nvarchar(80)='Uno Master'
      ,@Slug nvarchar(100)='uno'
      ,@StatusId int=1
      ,@PrimaryImageUrl nvarchar(max)='https://images.unsplash.com/photo-1595538742276-54d443f3b575?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwyfHx1bm98ZW58MHx8fHwxNjYxNjQzMzQ5&ixlib=rb-1.2.1&q=80&w=1080'
      ,@UserId int=120
	  
Select *
From dbo.Friends
where Id = @Id

Execute dbo.Friends_Update
	  @Title 
      ,@Bio 
      ,@Summary 
      ,@Headline 
      ,@Slug 
      ,@StatusId 
      ,@PrimaryImageUrl 
      ,@UserId 
	  ,@Id 

Select *
From dbo.Friends
where Id = @Id
*/

as 

BEGIN
Declare @todayDate datetime2 = getutcdate();

UPDATE [dbo].[Friends]
   SET [Title] = @Title
      ,[Bio] = @Bio
      ,[Summary] = @Summary
      ,[Headline] = @Headline
      ,[Slug] = @Slug
      ,[StatusId] = @StatusId
      ,[PrimaryImageUrl] = @PrimaryImageUrl
      ,[DateModified] = @todayDate
      ,[UserId] = @UserId
 WHERE Id= @Id


END
GO
