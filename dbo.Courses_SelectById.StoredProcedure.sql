USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Courses_SelectById]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Courses_SelectById]
			@Id int

/*
	Declare @Id int =3;

	Execute dbo.Courses_SelectById @Id


	Select c.Id
			,c.Name
			,c.Description
			,st.Term
			,t.Name
			,Students = (
						select s.Name as Name
						from dbo.Students s inner join dbo.StudentCourses sc
						on sc.StudentId = s.Id
						where sc.CourseId = c.Id
						for JSON AUTO)
	from dbo.Courses as c inner join dbo.SeasonTerms as st on c.SeasonTermId = st.Id
	join dbo.Teachers as t on c.TeacherId = t.Id

*/

as
BEGIN
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
	from dbo.Courses as c inner join dbo.SeasonTerms as st on c.SeasonTermId = st.Id
	join dbo.Teachers as t on c.TeacherId = t.Id 
	where c.Id = @Id;

END
GO
