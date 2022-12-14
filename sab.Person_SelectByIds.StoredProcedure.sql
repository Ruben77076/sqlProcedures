USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [sab].[Person_SelectByIds]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [sab].[Person_SelectByIds]
				@people sab.IntIdTable READONLY
/*
Declare @targetPeople sab.IntIdTable
		Insert into @targetPeople (data)
		Values (11),(16),(9),(8)

	--Select * from @targetPeople

	execute sab.Person_SelectByIds @targetPeople
*/
	as 
	BEGIN
	
	Declare @filteredPeople [sab].[IntIdTable]

	Insert into @filteredPeople (data)
	Select Data
	from @people as p
	where p.Data < 11



SELECT [PersonId]
      ,[LastName]
      ,[FirstName]
	  ,t.Data
  --FROM [sab].[Person] as p inner join @people as t
  FROM [sab].[Person] as p left outer join @filteredPeople as t
			on p.PersonId = t.Data
  where t.Data is not null
	END
GO
