USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_BatchSkills]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_BatchSkills]
		--@batchSkills dbo.SkillsUDT READONLY

		/*
Exec sp_rename '[dbo].[dbo.Friends_BatchSkills]','Friends_BatchSkills'
	----------------------------------------	
		Declare @mySkills as SkillsUDT


		Insert into @mySkills(Id,Name)
		Values (15,'Podcast')
		Insert into @mySkills(Id,Name)
		Values (16,'Multimedia Editing')

		Execute dbo.Friends_Batch @mySkills

		Select *
		from dbo.Skills
	--------------------------------
		Select *
		from dbo.Skills

		DELETE FROM [dbo].[Skills]
		  WHERE Id > 12

		Select *
		from dbo.Skills

*/

		as
		BEGIN 
		Select 1
		/*
		SET IDENTITY_INSERT dbo.Skills ON
		Insert into dbo.Skills (Name)

		Select   n.Name
		From @batchSkills as n
		SET IDENTITY_INSERT dbo.Skills OFF
		*/	
		END




GO
