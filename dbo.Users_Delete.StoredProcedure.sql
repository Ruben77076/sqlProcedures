USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


		CREATE proc [dbo].[Users_Delete]
					@Id int

/*
Declare @id int=1

Select *
from dbo.Users
Where Id=@id;

Execute dbo.Users_Delete @id

Select *
from dbo.Users
Where Id=@id;

Select *
from dbo.Users

*/
as
BEGIN
DELETE FROM [dbo].[Users]
      WHERE Id=@Id;
END
GO
