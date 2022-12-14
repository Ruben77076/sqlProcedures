USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [sab].[Course_InsertBatch_V2]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		

		CREATE proc [sab].[Course_InsertBatch_V2]
			@batchCourses sab.CourseV2 READONLY

			/*
Declare @newCourses sab.CourseV2

Insert into @newCourses(Credits,Title,DepId,Id)
Values (2,'Computer Science 1001',2,901)

Insert into @newCourses(Credits,Title,DepId,Id)
Values (10,'Made up course V4',2,803)

Execute sab.Course_InsertBatch_V2 @newCourses

Select *
from sab.Course

--Delete from sab.course
--where CourseId < 1000
*/


as
BEGIN

Execute sab.Course_InsertBatch_V2_Insert @batchCourses;

Execute sab.Course_InsertBatch_V2_Update @batchCourses;



END
GO
