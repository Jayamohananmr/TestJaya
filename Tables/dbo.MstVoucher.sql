SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstVoucher] (
		[Record_NO]      [bigint] IDENTITY(1, 1) NOT NULL,
		[Dt]             [datetime] NOT NULL,
		[VoucherNo]      [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[AccID]          [bigint] NOT NULL,
		[Amt]            [numeric](18, 2) NOT NULL,
		[ChqNo]          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ChqDate]        [datetime] NULL,
		[BankID]         [bigint] NOT NULL,
		[Narration]      [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[UserID]         [bigint] NULL,
		[EntryClose]     [bit] NULL,
		[DcDtime]        [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstVoucher]
	ADD
	CONSTRAINT [DF_MstVoucher_DcDtime]
	DEFAULT (getdate()) FOR [DcDtime]
GO
ALTER TABLE [dbo].[MstVoucher]
	ADD
	CONSTRAINT [DF_MstVoucher_EntryClose]
	DEFAULT ((0)) FOR [EntryClose]
GO
ALTER TABLE [dbo].[MstVoucher] SET (LOCK_ESCALATION = TABLE)
GO
