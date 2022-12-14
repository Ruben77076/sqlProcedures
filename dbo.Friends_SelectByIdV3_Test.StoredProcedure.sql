USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV3_Test]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_SelectByIdV3_Test]
				@Id int
/*
Declare @Id int =3;

Execute dbo.Friends_SelectByIdV3_Test @Id


*/
as
BEGIN
Select f.Id
		,f.Title
		,f.Bio
		,f.Summary
		,f.Headline
		,f.Slug
		,f.StatusId
		,i.Id
		,i.Url
		,i.TypeId
		
from [dbo].[FriendsV2] as f inner join dbo.Images as i
	on f.PrimaryImageId = i.Id
where f.Id = @Id;
END
GO
