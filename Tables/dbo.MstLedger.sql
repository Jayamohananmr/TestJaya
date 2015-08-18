SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstLedger] (
		[LedgerID]        [bigint] IDENTITY(1, 1) NOT NULL,
		[LedgerName]      [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Description]     [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DCDTime]         [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstLedger]
	ADD
	CONSTRAINT [PK_MST_Ledger]
	PRIMARY KEY
	CLUSTERED
	([LedgerID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstLedger]
	ADD
	CONSTRAINT [DF_MST_Ledger_DCDTime]
	DEFAULT (getdate()) FOR [DCDTime]
GO
ALTER TABLE [dbo].[MstLedger] SET (LOCK_ESCALATION = TABLE)
GO
