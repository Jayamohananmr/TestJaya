SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_MstVoucherDetails]  
	@INDt datetime,
	@INVoucherNo varchar(50),
	@INAccID bigint,
	@INGrpID bigint,
	@INProductID bigint,
	@INAmt numeric,
	@INChqNo varchar(50),
	@INChqDate datetime,
	@INBankID bigint,
	@INNarration varchar(1000),
	@INUserID bigint


AS

--------------------------------------------------------------------  
/*  

/*
exec Usp_MstVoucherDetails '3/21/2008',1222,12,12,12,120000,1200120001,'4/12/2008',12211,'xyxy12',122
SELECT * FROM MstVoucher
*/

=====================Original Query==================            
====================PURPOSE==========================   
=====================INPUT/OUTPUT====================   
INPUT PARA	
	@INDt ,
	@INVoucherNo ,
	@INAccID ,
	@INGrpID ,
	@INProductID ,
	@INAmt ,
	@INChqNo ,
	@INChqDate ,
	@INBankID ,
	@INNarration ,
	@INUserID 

OUTPUT PARA	none  
=====================PAGE NAME(CALLING)==============   
 
=====================CREATED BY/DATE ================  
DEEPESH JOSHI
21/3/2008
=====================CHANGED BY/DATE ================ 
*/
--------------------------------------------------------------------

SET NOCOUNT ON

DECLARE @RowCount int
DECLARE @errCount int


	BEGIN 

		IF @INVoucherNo<>0
				BEGIN

					UPDATE [MstVoucher] 
					SET Dt=@INDt, AccID=@INAccID, GrpID=@INGrpID, ProductID=@INProductID, Amt=@INAmt,
						ChqNo=@INChqNo, ChqDate=@INChqDate, BankID=@INBankID, Narration=@INNarration, UserID=@INUserID
					WHERE VoucherNo=@INVoucherNo 
					
					SELECT @RowCount=@@ROWCOUNT, @errCount=@@ERROR 
 					
					IF @RowCount=0
						BEGIN
							INSERT INTO [dbo].[MstVoucher] (Dt,VoucherNo,AccID,GrpID,ProductID,Amt,
															ChqNo,ChqDate,BankID,Narration,UserID)
							VALUES(@INDt ,@INVoucherNo ,@INAccID ,@INGrpID ,@INProductID ,@INAmt 
									,@INChqNo ,@INChqDate ,@INBankID ,@INNarration ,@INUserID )

							SELECT @RowCount=@@ROWCOUNT, @errCount=@@ERROR 
						END
 
				END

					
					IF @errCount<>0 --OR @RowCount=0
						Return 0
					ELSE
						Return 1
	END

SET NOCOUNT OFF

GO
