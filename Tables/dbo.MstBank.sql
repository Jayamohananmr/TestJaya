SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstBank] (
		[BankID]       [bigint] IDENTITY(1, 1) NOT NULL,
		[BankName]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DcDtime]      [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstBank]
	ADD
	CONSTRAINT [PK_MstBank]
	PRIMARY KEY
	CLUSTERED
	([BankID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstBank]
	ADD
	CONSTRAINT [DF_MstBank_DcDtime]
	DEFAULT (getdate()) FOR [DcDtime]
GO
ALTER TABLE [dbo].[MstBank] SET (LOCK_ESCALATION = TABLE)
GO
