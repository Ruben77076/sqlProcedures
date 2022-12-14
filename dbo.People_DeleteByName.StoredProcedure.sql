USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[People_DeleteByName]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



	CREATE proc [dbo].[People_DeleteByName]
			@name nvarchar(50)
	/*

	Declare @name nvarchar(50) = 'Sally'

	Select * 
	from dbo.People
		  WHERE Name = @name

	Execute dbo.People_DeleteByName @name

	Select * 
	from dbo.People
		  WHERE Name = @name
	*/
	as

	BEGIN
	

	DELETE FROM [dbo].[People]
	Where  Name = @name; 
	
	END
GO
