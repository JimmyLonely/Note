USE [MoneyTransferCore]
GO

/****** Object:  StoredProcedure [dbo].[usp_get_core_fee]    Script Date: 01/06/2016 02:26:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mateusz Pospieszny
-- Create date: 2010-01-27
-- Description:	Get core fees that can be assigned to a given fee_node
-- 09/30/15 RP: Added new SP parameters: @prepaid_payment_option and @first_use
-- =============================================
Alter PROCEDURE [dbo].[usp_get_core_fee] 
	-- Add the parameters for the stored procedure here
	@business_id bigint,
	
	@transaction_type bigint = null,
	@bill_payment_processor bigint = null,
	@service bigint = null,
	@dest_currency bigint = null,
	@dest_country bigint = null,
	@bill_payment_biller bigint = null,
	@fee_category bigint = null,
	@origin_country bigint = null,
	@origin_state bigint = null,
	@transaction_count bigint = null,
	@card_bin bigint = null,
	@dest_business bigint = null,
	@bill_payment_type bigint = null,
	@check_type bigint = null,
	@check_cashing_service_type bigint = null,
	@prepaid_transaction_type bigint = null,
	@risk_category bigint = null,
	@prepaid_payment_option bigint = null,
	@first_use bigint = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- a fee might be assigned to a fee plan or to baseline fee plan
	-- find any matching but return just one
	SELECT
		cf.core_fee_id, 
		ftfb.fee_node_id,
		cf.name,
		cf.total_formula,
		cf.total_value,
		cf.total_is_constant,
		cf.agent_formula,
		cf.agent_value,
		cf.agent_is_constant,
		cf.date_created,
		cf.last_updated,
		cf.created_by_id,
		cf.updated_by_id,
		cf.created_by_device_id,
		cf.updated_by_device_id,
		cf.fee_inbalance_behavior_id,
		cf.version,
		cf.comment,
		cf.deleted,
		cf.fee_charge_type_id,
		case
			when fa.core_fee_id is not null then 3 -- agent
			when ftf.core_fee_id is not null then 2 -- fee plan
			else 1 -- baseline
		end as fee_source_id
	FROM
		business b with (nolock)
		inner join fee_table_fee ftfb with (nolock)
			on ftfb.fee_table_id = 1
			and b.business_id = @business_id
			and ftfb.fee_node_id = dbo.ufn_get_fee_node(
				@transaction_type,
				@bill_payment_processor,
				@service,
				@dest_currency,
				@dest_country,
				@bill_payment_biller,
				@fee_category,
				@origin_country,
				@origin_state,
				@transaction_count,
				@card_bin,
				@dest_business,
				@bill_payment_type,
				@check_type,
				@check_cashing_service_type,
				@prepaid_transaction_type,
				@risk_category,
				@prepaid_payment_option,
				@first_use)
		left join fee_table_fee ftf with (nolock)
			on ftf.fee_table_id = b.fee_table_id
			and ftfb.fee_node_id = ftf.fee_node_id
		left join fee_agent fa with (nolock)
			on fa.business_id = b.business_id
			and fa.fee_node_id = ftfb.fee_node_id
		inner join core_fee cf with (nolock)
			on cf.core_fee_id = coalesce(fa.core_fee_id, ftf.core_fee_id, ftfb.core_fee_id)
END

GO


