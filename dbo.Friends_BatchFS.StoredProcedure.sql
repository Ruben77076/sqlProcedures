USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_BatchFS]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_BatchFS]
			@batchFSkills dbo.FriendSkillsUDT READONLY

/*
	Declare @myFSkills as FriendSkillsUDT

	Insert into @myFSkills(FriendId,SkillId)
	Values(50,10)
	Insert into @myFSkills(FriendId,SkillId)
	Values(51,9)

	Execute dbo.Friends_BatchFS @myFSkills

	Select *
	from dbo.FriendSkills

*/



as
BEGIN

		Insert into dbo.FriendSkills(FriendId,SkillId)

		Select n.FriendId
				,n.SkillId
		from @batchFSkills as n

END
GO
