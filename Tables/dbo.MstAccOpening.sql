SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstAccOpening] (
		[AccID]           [bigint] NOT NULL,
		[OpeningAson]     [datetime] NOT NULL,
		[Value]           [numeric](18, 2) NULL,
		[DcDtime]         [datetime] NULL,
		[gg]              [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstAccOpening]
	ADD
	CONSTRAINT [DF_MstAccOpening_DcDtime]
	DEFAULT (getdate()) FOR [DcDtime]
GO
ALTER TABLE [dbo].[MstAccOpening] SET (LOCK_ESCALATION = TABLE)
GO
