USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[People_Delete]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



	CREATE proc [dbo].[People_Delete]
			@id int
	/*

	Declare @id int = 9;

	Select * 
	from dbo.People
		  WHERE Id = @id;

	Execute dbo.People_Delete @id

	Select * 
	from dbo.People
		  WHERE Id = @id;
	*/
	as

	BEGIN
	

	DELETE FROM [dbo].[People]
	Where Id = @id; 
	

		  


	END
GO
