USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectAll]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_SelectAll]

as
/*


Execute dbo.People_SelectAll
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


END
GO
