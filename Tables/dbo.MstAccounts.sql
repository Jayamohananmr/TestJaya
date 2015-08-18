SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstAccounts] (
		[AccID]           [bigint] IDENTITY(1, 1) NOT NULL,
		[AccountName]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DcDtime]         [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstAccounts]
	ADD
	CONSTRAINT [PK_MstAccounts]
	PRIMARY KEY
	CLUSTERED
	([AccID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstAccounts]
	ADD
	CONSTRAINT [DF_MstAccounts_DcDtime]
	DEFAULT (getdate()) FOR [DcDtime]
GO
ALTER TABLE [dbo].[MstAccounts] SET (LOCK_ESCALATION = TABLE)
GO
