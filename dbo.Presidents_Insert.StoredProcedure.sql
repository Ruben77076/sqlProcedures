USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Presidents_Insert]
			@FirstName nvarchar(50)
			,@LastName nvarchar(50)
			,@InaugurationDate datetime2(7)
			,@FirstYearInOffice int
			,@LastYearInOffice int
			,@PartyAffiliation nvarchar(50)
			,@Id int OUTPUT
/*
	Declare @Id int= 0;

	Declare @FirstName nvarchar(50)='Barack'
			,@LastName nvarchar(50)='Obama'
			,@InaugurationDate datetime2(7)= 1-20-2009
			,@FirstYearInOffice int=2009
			,@LastYearInOffice int=2017
			,@PartyAffiliation nvarchar(50)='Democratic'
			
			
	Execute dbo.Presidents_Insert
			@FirstName 
			,@LastName 
			,@InaugurationDate 
			,@FirstYearInOffice 
			,@LastYearInOffice 
			,@PartyAffiliation 
			,@Id OUTPUT

	Select @Id

	Select *
	from dbo.Presidents
	where Id=@Id

	Select *
	from dbo.Presidents


*/

as
BEGIN

INSERT INTO [dbo].[Presidents]
           ([FirstName]
           ,[LastName]
           ,[InaugurationDate]
           ,[FirstYearInOffice]
           ,[LastYearInOffice]
           ,[PartyAffiliation]
           )
     VALUES
           (@FirstName 
			,@LastName 
			,@InaugurationDate 
			,@FirstYearInOffice 
			,@LastYearInOffice 
			,@PartyAffiliation 
			)
	SET @Id = SCOPE_IDENTITY()


END
GO
