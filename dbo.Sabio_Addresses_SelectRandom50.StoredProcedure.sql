USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Sabio_Addresses_SelectRandom50]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create proc [dbo].[Sabio_Addresses_SelectRandom50]

/*

	Execute [dbo].[Sabio_Addresses_SelectRandom50]

*/

as
BEGIN

	SELECT top 50 
	      [Id]
		  ,[LineOne]
		  ,[SuiteNumber]
		  ,[City]
		  ,[State]
		  ,[PostalCode]
		  ,[IsActive]
		  ,[Lat]
		  ,[Long]
	  FROM [dbo].[Sabio_Addresses]
	  Order By NEWID()

END




GO
