USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Sabio_Addresses_DeleteById]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create proc [dbo].[Sabio_Addresses_DeleteById]
			@Id int
/*

	declare @Id int = 10
	Execute [dbo].[Sabio_Addresses_DeleteById] @Id

*/

as
BEGIN

	  DELETE
	  FROM [dbo].[Sabio_Addresses]
	  Where Id = @Id

END




GO
