USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [sab].[Course_InsertBatch_V2_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		

		Create proc [sab].[Course_InsertBatch_V2_Insert]
			@batchCourses sab.CourseV2 READONLY



as
BEGIN



SET IDENTITY_INSERT sab.Course ON
Insert into sab.Course(Credits,Title,DepartmentId,CourseId)


Select n.Credits
		,n.Title
		,n.DepId
		,n.Id
From @batchCourses as n
where not Exists (
					Select 1
					from sab.Course as c
					where c.CourseId= n.Id)

SET IDENTITY_INSERT sab.Course OFF
END
GO
