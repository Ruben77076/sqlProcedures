USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Pagination]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Courses_Pagination]
				@PageIndex int = 0
				,@PageSize int = 4

	/*
	Declare @PageSize int;
	Declare @PageIndex int;
	SET @PageIndex = 0;

	Execute dbo.Courses_Pagination @PageIndex

	*/

	as
	BEGIN
	
	Declare @offset int = @PageIndex * @PageSize

	Select c.Id
			,c.Name
			,c.Description
			,st.Term as SeasonTerm
			,t.Name as Teacher
			,Students = (
						select s.Id as Id,s.Name as Name
						from dbo.Students s inner join dbo.StudentCourses sc
						on sc.StudentId = s.Id
						where sc.CourseId = c.Id
						for JSON AUTO)
			,TotalCount= COUNT(1) OVER()
	from dbo.Courses as c inner join dbo.SeasonTerms as st on c.SeasonTermId = st.Id
	join dbo.Teachers as t on c.TeacherId = t.Id 
	order by c.Id

	OFFSET @offset Rows
	Fetch Next @PageSize Rows Only
	END
GO
