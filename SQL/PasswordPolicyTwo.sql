USE [MoneyTransferCore]
GO
/****** Object:  StoredProcedure [dbo].[usp_get_password_patterns]    Script Date: 12/01/2015 00:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
--================================================================================
-- Author:        Rafal Podgorski
-- Created:        February 13, 2015
-- Description:    Returns all active password patters that correspond to the password
--                pattern use id, which indicates the area of an application where the
--                password pattern is in use.  Also returns a flag indicating if the
--                the reverse of the pattern evaluates to true and a message to show on
--                pattern failure, if configured.
--=================================================================================
 
alter PROCEDURE [dbo].[usp_get_password_patterns]
(
    @PasswordPatternUseId int
)
AS
BEGIN
    
SELECT
    pp.password_pattern,
    pp.reverse_match,
    pp.description_ui
FROM
    password_pattern pp with(nolock)
INNER JOIN
    password_pattern_use_xref pp_x with(nolock)
    ON pp_x.password_pattern_id = pp.password_pattern_id
WHERE
    pp_x.password_pattern_use_id = @PasswordPatternUseId
    AND pp.is_active = 1
 
END
