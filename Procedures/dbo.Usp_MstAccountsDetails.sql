SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_MstAccountsDetails]  
    @INAccID Bigint ,
	@INAccountName varchar(100)
AS   
--------------------------------------------------------------------  
/*  

/*
exec Usp_MstAccountsDetails 0,'xyz1'
*/

=====================Original Query==================            
====================PURPOSE==========================   
=====================INPUT/OUTPUT====================   
INPUT PARA	
     @INAccountName   

OUTPUT PARA	none  
=====================PAGE NAME(CALLING)==============   
 
=====================CREATED BY/DATE ================  
DEEPESH JOSHI
21/3/2008
=====================CHANGED BY/DATE ================ 

aaa
*/
--------------------------------------------------------------------
SET NOCOUNT ON

DECLARE @errCount int


	BEGIN 

		IF @INAccID<>0
				BEGIN
					UPDATE [MstAccounts] SET AccountName=@INAccountName
					WHERE AccID=@INAccID 

					SET @errCount=@@ERROR 
					
				END
		ELSE
				BEGIN
					INSERT INTO [dbo].[MstAccounts] (AccountName)
					VALUES(@INAccountName)

					SET @errCount=@@ERROR

				END

					
					IF @errCount<>0 
						Return 0
					ELSE
						Return 1
	END

SET NOCOUNT OFF




GO
