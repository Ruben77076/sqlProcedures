USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Sabio_Addresses_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Sabio_Addresses_Insert]
			@Id int OUTPUT,
			@LineOne nvarchar(50),
			@SuiteNumber int,
			@City nvarchar(50),
			@State nvarchar(50),
			@PostalCode nvarchar(50),
			@IsActive bit,
			@Lat float,
			@Long float
as

BEGIN




	INSERT INTO [dbo].[Sabio_Addresses]
           ([LineOne]
           ,[SuiteNumber]
           ,[City]
           ,[State]
           ,[PostalCode]
           ,[IsActive]
           ,[Lat]
           ,[Long])
     VALUES
           (
		   @LineOne	
		   ,@SuiteNumber
		   ,@City		
		   ,@State		
		   ,@PostalCode	
		   ,@IsActive	
		   ,@Lat		
		   ,@Long	
		   )

	SET @Id = SCOPE_IDENTITY()





END



GO
