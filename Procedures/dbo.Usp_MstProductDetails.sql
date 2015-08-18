SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_MstProductDetails]  
    @INPrdID Bigint,
	@INProductName varchar(50),
	@INDescription varchar(100)
AS   
--------------------------------------------------------------------  
/*  

/*
exec Usp_MstProductDetails 0,'xyz','xyz1'
SELECT * FROM MstProduct

*/

=====================Original Query==================            
====================PURPOSE==========================   
=====================INPUT/OUTPUT====================   
INPUT PARA	
    @INPrdID ,
	@INProductName ,
	@INDescription 

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

		IF @INPrdID<>0
				BEGIN
					UPDATE [MstProduct] SET ProductName=@INProductName, [Description]=@INDescription
					WHERE PrdID=@INPrdID 
					
					SET @errCount=@@ERROR 
					
				END
		ELSE
				BEGIN
					INSERT INTO [dbo].[MstProduct] (ProductName,[Description])
					VALUES(@INProductName, @INDescription)
					
					SET @errCount=@@ERROR

				END

					
					IF @errCount<>0 
						Return 0
					ELSE
						Return 1
	END

SET NOCOUNT OFF

GO
