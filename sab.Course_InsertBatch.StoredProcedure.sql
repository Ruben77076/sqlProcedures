USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [sab].[Course_InsertBatch]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		

		CREATE proc [sab].[Course_InsertBatch]
			@newCourses sab.Course READONLY


/*
Declare @newCourses sab.Course


Insert into @newCourses(Credits,Title,DepId)
Values (2,'My Great subject',7)
Insert into @newCourses(Credits,Title,DepId)
Values (10,'CS 1001',2)

Execute sab.Course_InsertBatch @newCourses

Select *
from sab.Course
*/
as
BEGIN
Insert into sab.Course(Credits,Title,DepartmentId)


Select n.Credits
		,n.Title
		,n.DepId
From @newCourses as n
END
GO
