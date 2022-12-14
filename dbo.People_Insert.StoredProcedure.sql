USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[People_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[People_Insert]
	

        @PersonName nvarchar(50)
		,@Age int 
		,@UserId nvarchar(128)
		,@IsASmoker bit
		,@Id int OUTPUT

/* -----Test Code-----
   
  
 
 Declare @Id int=0

	Declare @PersonName nvarchar(50) = 'Bill'
		,@Age int = 25
		,@UserId nvarchar(128)='ms.susan'
		,@IsASmoker bit=null 


Execute dbo.People_Insert 
						@PersonName
						,@Age
						,@UserId
						,@IsASmoker
						,@Id OUTPUT

Select @Id

Select *
From dbo.People
where Id = @Id
*/

as

BEGIN
	

INSERT INTO [dbo].[People]
           ([Name]
           ,[Age]
           ,[IsSmoker]
           ,[UserId])
     VALUES
           (@PersonName
           ,@Age
           ,@IsASmoker
           ,@UserId)

SET @Id = SCOPE_IDENTITY()




END
GO
