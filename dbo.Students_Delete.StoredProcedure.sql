USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Students_Delete]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Students_Delete]
			@Id int

	/*
	Declare @Id int = 1005;

	Select * 
	from dbo.Students
		  WHERE Id = @id;

	Execute dbo.Students_Delete @Id

	Select * 
	from dbo.Students
		  WHERE Id = @Id;
	Select *
	from dbo.Students

	*/

	as
	BEGIN
	DELETE FROM [dbo].[Students]
      WHERE Id = @Id;
	END
GO
