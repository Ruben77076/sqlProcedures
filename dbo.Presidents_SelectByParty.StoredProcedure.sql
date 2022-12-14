USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_SelectByParty]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Presidents_SelectByParty]
				@PartyAffiliation nvarchar(50)
/*
	Declare @PartyAffiliation nvarchar(50)
	Set @PartyAffiliation = 'Republican%'
	
	Execute dbo.Presidents_SelectByParty @PartyAffiliation

	Select *
	from dbo.Presidents

*/

as
BEGIN

SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[PartyAffiliation]
      ,[InaugurationDate]
      
  FROM [dbo].[Presidents]
  Where (PartyAffiliation LIKE '%' + @PartyAffiliation) 




END
GO
