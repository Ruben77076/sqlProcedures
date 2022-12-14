USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Courses_Insert]
				@Name nvarchar(200)
				,@Description nvarchar(200)
				,@SeasonTermId int
				,@TeacherId int
				,@Id int OUTPUT

	/*
		Declare @Id int = 0;

		Declare @Name nvarchar(200)= 'Popular Literary Genres '
				,@Description nvarchar(200)='Introduction to the study of one or more popular literary genres, such as mystery, crime fiction, urban romance, fantasy, science fiction, horror, gothic, western, thriller, spy fiction, etc. Analysis of generic conventions and how these conventions reflect sociocultural concerns over time. Focus on skills requisite for thinking and writing critically about literary works within their historical contexts. Critical writing is an integral part of the course'
				,@Term int=1
				,@TeacherName int=2

		Execute dbo.Courses_Insert
				@Name
				,@Description
				,@Term
				,@TeacherName
				,@Id OUTPUT

		Select @Id

		Select *
		from dbo.Courses
		where Id = @Id

		Select *
		from dbo.Courses
		
		
		



	*/

	as 
	BEGIN

	--Declare @SeasonTermId int

	--INSERT INTO [dbo].[SeasonTerms]
 --          ([Term])
 --    VALUES
 --          (@Term)
	--SET @SeasonTermId = SCOPE_IDENTITY()
	
	--Declare @TeacherId int
	--INSERT INTO [dbo].[Teachers]
 --          ([Name])
 --    VALUES
 --          (@TeacherName)

	--SET @TeacherId = SCOPE_IDENTITY()



	INSERT INTO [dbo].[Courses]
           ([Name]
           ,[Description]
           ,[SeasonTermId]
           ,[TeacherId])
     VALUES
           (@Name
			,@Description
			,@SeasonTermId
			,@TeacherId)
	SET @Id = SCOPE_IDENTITY()
	END
GO
