USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[People_Update]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[People_Update]
		@PersonName nvarchar(50)
		,@Age int 
		,@UserId nvarchar(128)
		,@IsASmoker bit
		,@Id int 
as 

/*
Declare @Id int=11;

	Declare @PersonName nvarchar(50) = 'Joe'
		,@Age int = 55
		,@UserId nvarchar(128)='44444'
		,@IsASmoker bit=1

		Select *
	From dbo.People
	Where Id=@Id


Execute dbo.People_Update 
						@PersonName
						,@Age
						,@UserId
						,@IsASmoker
						,@Id

			Select *
			From dbo.People
			where Id = @Id


*/


BEGIN

Declare @dateNow datetime2 = getutcdate();

UPDATE [dbo].[People]
	   SET [Name] = @PersonName
		  ,[Age] = @Age
		  ,[IsSmoker] = @IsASmoker
		  ,[DateModified] = @dateNow
		  ,[UserId] = @UserId
	 WHERE Id=@Id

END
GO
