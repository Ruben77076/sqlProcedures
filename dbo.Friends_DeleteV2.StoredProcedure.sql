USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_DeleteV2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Friends_DeleteV2]
					@Id int
	/*
	Declare @Id int=185;
	

	Select *
	from dbo.FriendsV2
	where Id=@id;

	Execute dbo.Friends_DeleteV2 @Id

	Select *
	from dbo.FriendsV2
	where Id=@id;

	Select *
	from dbo.FriendsV2



	*/
	as
	BEGIN
	

DELETE FROM [dbo].[FriendsV2]
      WHERE Id=@Id



	END
GO
