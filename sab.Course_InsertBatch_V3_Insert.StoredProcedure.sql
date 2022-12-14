USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [sab].[Course_InsertBatch_V3_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [sab].[Course_InsertBatch_V3_Insert]
			@batchCourses sab.CourseV2 READONLY

/*
Declare @newCourses sab.CourseV2

Insert into @newCourses (Credits, Title, DepId,Id)
Values (2, 'Computer Science 1001',2,9000)
		,(2, 'English 304',4,9001)

Execute sab.Course_InsertBatch_V3_Insert @newCourses


select  * from sab.Course
where CourseId > 4100
order by CourseId desc

*/

as 
BEGIN
	--Colum CourseId is the PK column
	Declare @IdResults as Table (PkId int, TxId int)

	Declare @datMod datetime2 = getutcdate()

	--No primary key inserted
	Insert into sab.Course( Credits
							,Title
							,DepartmentId
							,DateModified
							,TxId)
	Output INSERTED.CourseId
			,INSERTED.TxId
	INTO @IdResults
		(
		PkId		
		,TxId)
	Select n.Credits
			,n.Title
			,n.DepId
			,@datMod
			,n.Id
	From @batchCourses as n

	Select PkId
			,TxId
	From @IdResults



END
GO
