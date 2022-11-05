USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectById]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[People_SelectById]
		@Id int

as
/*

Declare @Id int = 9;

Execute dbo.People_SelectById @Id
*/


BEGIN
	SELECT [Id]
		,[Name]
		,[Age]
		,[IsSmoker]
		,[DateAdded]
		,[DateModified]
		,[UserId]
		FROM [dbo].[People]
		Where Id=@Id


END
GO
