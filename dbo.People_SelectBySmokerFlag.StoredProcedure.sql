USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectBySmokerFlag]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[People_SelectBySmokerFlag]
		@SmokerFlag bit

as
/*

Declare @SmokerFlag int = null;

Execute dbo.[People_SelectBySmokerFlag] @SmokerFlag
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
		Where ([IsSmoker]=@SmokerFlag)
				OR
			   (@SmokerFlag IS NULL AND [IsSmoker] IS NULL)


END
GO
