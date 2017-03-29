USE [MoneyTransferCore]
GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;
SET NUMERIC_ROUNDABORT OFF;
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO

/****** Object:  Table [dbo].[security_log]    Script Date: 12/24/2015 13:04:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lu_payment_method_type]') AND type in (N'U'))
BEGIN
	DROP TABLE [security_log]
END

CREATE TABLE [dbo].[security_log](
	[security_log_id] [bigint] NOT NULL,
	[ip_address] [varchar](50) NULL,
	[ip_country_code_id] [int] NULL,
	[date_created] [datetime] NULL,
	[successful_login] [bit] NULL,
	[username] [varchar](50) NULL,
	[client_mac_address] [varchar](50) NULL,
	[comment] [varchar](200) NULL,
) ON [PRIMARY]

SET ANSI_PADDING OFF
GO

IF @@ERROR <> 0 AND @@TRANCOUNT > 0 BEGIN ROLLBACK; END
IF @@TRANCOUNT = 0 BEGIN INSERT  INTO #tmpErrors (Error) VALUES (1); BEGIN TRANSACTION; END
GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'Update succeeded.'
COMMIT TRANSACTION
END
ELSE PRINT 'Update failed.'
GO
DROP TABLE #tmpErrors
GO
