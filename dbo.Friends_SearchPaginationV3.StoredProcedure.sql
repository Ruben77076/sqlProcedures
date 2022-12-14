USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SearchPaginationV3]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Friends_SearchPaginationV3]
				(@PageIndex int=0
				 ,@PageSize int=8
				 ,@Query nvarchar(100))

	/*

	Declare @PageSize int;
	Declare @PageIndex int;
	Declare @Query nvarchar(100);
	SET @PageIndex= 0;
	SET @PageSize = 20;
	SET @Query = 'xia%'

	Execute dbo.Friends_SearchPaginationV3 @PageIndex,@PageSize,@Query

	Select *
	from dbo.FriendsV2

	*/

	as
	BEGIN
	
	Declare @offset int= @PageIndex * @PageSize

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
			,f.UserId
			,f.DateCreated
			,f.DateModified
			,Skills=(
					select s.Id as skillId,s.Name as skillName
					from dbo.Skills s inner join dbo.FriendSkills fs
					on fs.SkillId = s.Id
					where fs.FriendId = f.Id
					for JSON AUTO
			)
			,TotalCount= COUNT(1) OVER()
	from dbo.FriendsV2 as f inner join dbo.Images as i
			on f.PrimaryImageId = i.Id
	where (Title LIKE '%' + @Query OR
			Bio LIKE '%' + @Query OR
			Summary LIKE '%' + @Query OR
			Headline LIKE '%' + @Query OR
			Slug LIKE '%' + @Query OR
			UserId LIKE '%' + @Query)
	order by f.Id

		OFFSET @offset Rows
		Fetch Next @PageSize Rows Only

	END
GO
