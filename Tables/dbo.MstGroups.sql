SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstGroups] (
		[GrpID]         [bigint] IDENTITY(1, 1) NOT NULL,
		[AccID]         [bigint] NOT NULL,
		[GroupName]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DcDtime]       [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MstGroups]
	ADD
	CONSTRAINT [DF_MstGroups_DcDtime]
	DEFAULT (getdate()) FOR [DcDtime]
GO
ALTER TABLE [dbo].[MstGroups] SET (LOCK_ESCALATION = TABLE)
GO
