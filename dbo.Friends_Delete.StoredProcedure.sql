USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Delete]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_Delete]
		@Id int
/*
Declare @id int=9;

Select *
from dbo.Friends
Where Id=@id;

Execute dbo.Friends_Delete  @id

Select *
from dbo.Friends
Where Id=@id;

*/

as 

BEGIN

DELETE FROM [dbo].[Friends]
      WHERE Id = @id;



END
GO
