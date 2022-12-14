USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_BatchI]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			CREATE proc [dbo].[Friends_BatchI]
						@batchImages dbo.ImagesUDT READONLY

			/*
			Declare @myImages as ImagesUDT

			Insert into @myImages(Id,TypeId,Url)
			Values (50,2,'https://images.unsplash.com/photo-1609445333560-e03ba271b2ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwyfHxob3VzdG9ufGVufDB8fHx8MTY2MTk3NTM1NA&ixlib=rb-1.2.1&q=80&w=1080')
			Insert into @myImages(Id,TypeId,Url)
			Values (51,3,'https://images.unsplash.com/photo-1609445333560-e03ba271b2ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwyfHxob3VzdG9ufGVufDB8fHx8MTY2MTk3NTM1NA&ixlib=rb-1.2.1&q=80&w=1080')
			
			Execute dbo.Friends_BatchI @myImages

			Select *
			from dbo.Images
			


			*/
			as
			BEGIN
			

				Insert into dbo.Images (TypeId,Url)

				Select n.TypeId
						,n.Url
				from @batchImages as n
			END
GO
