SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRNVoucher] (
		[Record_NO]     [bigint] NOT NULL,
		[GrpID]         [bigint] NOT NULL,
		[LedgerID]      [bigint] NOT NULL,
		[Amount]        [decimal](18, 2) NOT NULL,
		[Narration]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DCDTime]       [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TRNVoucher]
	ADD
	CONSTRAINT [DF_TRN_Entry_DCDTime]
	DEFAULT (getdate()) FOR [DCDTime]
GO
CREATE NONCLUSTERED INDEX [IX_TRN_Entry]
	ON [dbo].[TRNVoucher] ([Record_NO], [GrpID], [LedgerID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[TRNVoucher] SET (LOCK_ESCALATION = TABLE)
GO
