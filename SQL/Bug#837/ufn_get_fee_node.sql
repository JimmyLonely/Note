USE [MoneyTransferCore]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_get_fee_node]    Script Date: 01/06/2016 02:04:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mateusz Pospieszny
-- Create date: 2009-01-25
-- Description:	Given a set of values describing a transaction/requested fee, 
--				return the fee_node_id of such a fee
-- YV 03/14/2012 Made changes in order to properly traverse the tree, always selecting nodes with specific values over defaults
-- RP 09/30/15: Added new function parameters: @prepaid_payment_option and @first_use
-- =============================================
Alter FUNCTION [dbo].[ufn_get_fee_node] 
(
	-- parameters come from the lu_fee_node_type table, there should be one to one relatinship between them
    -- except the top level node - Fee/Costs since we only deal with fees in here
	@transaction_type bigint,
	@bill_payment_processor bigint,
	@service bigint,
	@dest_currency bigint,
	@dest_country bigint,
	@bill_payment_biller bigint,
	@fee_category bigint,
	@origin_country bigint,
	@origin_state bigint,
	@transaction_count bigint,
	@card_bin bigint,
	@dest_business bigint,
	@bill_payment_type bigint,
	@check_type bigint,
	@check_cashing_service_type bigint,
	@prepaid_transaction_type bigint,
	@risk_category bigint,
	@prepaid_payment_option bigint,
	@first_use bigint
)
RETURNS int
AS
BEGIN
	DECLARE @fee_node_id int;

	-- convert the parameter values into a table
	DECLARE @inputs TABLE
	(
		fee_node_type_id int,
		fee_node_value bigint
	)

	IF(@transaction_type is not null)
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (2, @transaction_type);
	END;
	IF(@bill_payment_processor is not null)
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (3, @bill_payment_processor);
	END;
	IF(@service is not null)
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (4, @service);
	END;
	If @dest_currency is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (5, @dest_currency);
	END;
	IF @dest_country is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (6, @dest_country);
	END;
	IF @bill_payment_biller is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (7, @bill_payment_biller);
	END;
	IF @fee_category is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (8, @fee_category);
	END;
	IF @origin_country is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (9, @origin_country);
	END;
	IF @origin_state is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (10, @origin_state);
	END;
	IF @transaction_count is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (11, @transaction_count);
	END;
	IF @card_bin is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (12, @card_bin);
	END;
	IF @dest_business is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (16, @dest_business);
	END;
	IF @bill_payment_type is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (17, @bill_payment_type);
	END;
	IF @check_type is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (19, @check_type);
	END;
	IF @check_cashing_service_type is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (20, @check_cashing_service_type);
	END;
	IF @prepaid_transaction_type is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (21, @prepaid_transaction_type);
	END;
	IF @risk_category is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (22, @risk_category);
	END;
	IF @prepaid_payment_option is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (23, @prepaid_payment_option);
	END;
	IF @first_use is not null
	BEGIN
		insert into @inputs (fee_node_type_id, fee_node_value) values (24, @first_use);
	END;
	-- Now off to find the node id
	
	WITH tree (
		fee_node_id, 
		parent_id,
		fee_node_type_id, 
		fee_node_value,
		level,
		default_value,
		default_lineage
	) AS (
		SELECT 
			f.fee_node_id, 
			f.parent_id,
			f.fee_node_type_id, 
			f.fee_node_value,
			0,
			f.default_value,
			case when f.default_value = 1 then 1 else 0 end
		FROM 
			fee_node f WITH (nolock) 
			inner join @inputs i
			ON f.fee_node_type_id = i.fee_node_type_id 
				AND (f.fee_node_value = i.fee_node_value OR f.fee_node_value is null)
			where parent_id is null
				AND NOT ( f.fee_node_type_id = 2 AND f.fee_node_value = 0)
				AND f.is_active=1
		UNION ALL
		SELECT
			f.fee_node_id, 
			f.parent_id,
			f.fee_node_type_id,
			f.fee_node_value,
			t.level + 1,
			f.default_value,
			t.default_lineage + case when f.default_value = 1 then 1 else 0 end
		FROM
			fee_node f WITH (nolock)
			inner join tree t 
			ON f.parent_id = t.fee_node_id
				AND f.is_active=1
			inner join @inputs i
			ON f.fee_node_type_id = i.fee_node_type_id 
				AND (f.fee_node_value = i.fee_node_value OR f.fee_node_value is null)
	)

	SELECT 
		top 1 @fee_node_id = t.fee_node_id
	FROM 
		tree t
		left join fee_node f with (nolock)
	ON
		f.parent_id = t.fee_node_id
	WHERE 
		f.fee_node_id is null
	ORDER BY 
		t.default_lineage asc,
		t.level desc,
		t.default_value asc

	RETURN @fee_node_id;
END

GO


