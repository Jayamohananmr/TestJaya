SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_MstGroupsDetails]  
    @INGrpID Bigint,
    @INAccID Bigint,
	@INGroupName varchar(100)
AS   
--------------------------------------------------------------------  
/*  

/*
exec Usp_MstGroupsDetails 0,12,'xy'
SELECT * FROM MstGroups
*/

=====================Original Query==================            
====================PURPOSE==========================   
=====================INPUT/OUTPUT====================   
INPUT PARA	
    @INGrpID ,
    @INAccID ,
	@INGroupName 

OUTPUT PARA	none  
=====================PAGE NAME(CALLING)==============   
 
=====================CREATED BY/DATE ================  
DEEPESH JOSHI
21/3/2008
=====================CHANGED BY/DATE ================ 
*/
--------------------------------------------------------------------
SET NOCOUNT ON

DECLARE @errCount int


	BEGIN 

		IF @INGrpID<>0
				BEGIN

					UPDATE [MstGroups] SET AccID=@INAccID, GroupName=@INGroupName
					WHERE GrpID=@INGrpID 
					
					SET @errCount=@@ERROR 
					
				END
		ELSE
				BEGIN
						INSERT INTO [dbo].[MstGroups] (AccID,GroupName)
						VALUES(@INAccID, @INGroupName)

					SET @errCount=@@ERROR

				END

					
					IF @errCount<>0 
						Return 0
					ELSE
						Return 1
	END

SET NOCOUNT OFF
GO
