USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [sab].[Course_InsertBatch_V2_Update]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


		CREATE proc [sab].[Course_InsertBatch_V2_Update]
			@batchCourses sab.CourseV2 READONLY



as
BEGIN

Declare @dateMod datetime2 = '01/01/1900'

Update sab.Course
	set Credits = b.Credits
		,Title= b.Title
		,DepartmentId=b.DepId
		,DateModified = @dateMod
from @batchCourses as b inner join sab.Course as c
		on c.CourseId = b.Id



END
GO
