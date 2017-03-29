USE [MoneyTransferCore]
GO

/****** Object:  StoredProcedure [dbo].[usp_find_express_local_billers]    Script Date: 01/06/2016 02:23:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Yevgeniy Volpert
-- Create date: 2011-06-27
-- Description:	Find most popular express billers that are used near the agent
-- Leverages functionality from usp_find_local_billers
-- =============================================
Alter PROCEDURE [dbo].[usp_find_express_local_billers]
	@business_id bigint,
	@transaction_type_id int,
	@domestic bit
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @zip varchar(5),
			@zip_code varchar(5),
			@state_id int,
			@range int,
			@start_date datetime;

	-- the oldest transaction that we are interested in:
	SET @start_date = dateadd(month, -6, getutcdate());

	-- get the zip code of the business
	select 
		@zip = zipcode,
		@state_id = state_id
	from
		business with (nolock)
	where
		business_id=@business_id;
	
	-- check if we have location data for this zip, if we don't then the search will return no values
	select 
		@zip_code = zip 
	from
		zip_code with (nolock)
	where 
		zip = @zip
 
	-- the radius of the search (miles)
	set @range = 50;

	IF(@zip_code is not null)
	BEGIN
		-- now look for the billers that are popular in the area looking at the zip distance
		select
			biller.[bill_payment_biller_id]
		  ,coalesce(s.bill_payment_service_name, biller.[biller_name]) as biller_name
		  ,biller.[biller_class_id]
		  ,biller.[deleted] | s.deleted as deleted
		  ,s.bill_payment_service_id
		  ,s.bill_payment_processor_id
		  ,s.bill_payment_type_id
		  ,s.transaction_type_id
		  ,biller.country_id
		  ,s.destination_currency_id
		  ,s.min_value
		  ,s.max_value
		  ,s.fixed_value
		  ,s.notes_en
		  ,s.notes_es
		  ,s.bill_payment_biller_service_status_code
		  ,ISNULL(s.use_processor_balance, 0) as use_processor_balance
		  ,ISNULL(s.processor_partial_payments, 0) as processor_partial_payments
		from
			(select top 25 
				biller.bill_payment_biller_id, 
				count(1) as count
			from 
				dbo.ufn_get_nearby_zip_codes(@zip, @range) z 
			inner join 
				business b with (nolock) on b.zipcode = z.zip_code and b.business_type_id=1 
			inner join
				bill_payment_transaction t with (nolock) 
			on 
				b.business_id=t.business_id 
				and t.date_created > @start_date
				and t.transaction_type_id = @transaction_type_id 
			inner join
				bill_payment_biller biller with (nolock) 
			on 
				t.bill_payment_biller_id = biller.bill_payment_biller_id
				and ((@domestic = 1 and biller.country_id = 840) OR (@domestic = 0 and biller.country_id != 840)) 
				and biller.deleted = 0
			group by 
				biller.bill_payment_biller_id
			order by 
				count(1) desc) popular
		inner join
			bill_payment_biller biller with (nolock) on biller.bill_payment_biller_id = popular.bill_payment_biller_id
		inner join
			bill_payment_biller_service s with(nolock) ON biller.bill_payment_biller_id = s.bill_payment_biller_id AND s.bill_payment_biller_service_status_code <> 'I'
	END
	ELSE
	BEGIN
	-- if we were unlucky enough to not to get any results, then just look by state
		select
			biller.[bill_payment_biller_id]
		  ,coalesce(s.bill_payment_service_name, biller.[biller_name]) as biller_name
		  ,biller.[biller_class_id]
		  ,biller.[deleted] | s.deleted as deleted
		  ,s.bill_payment_service_id
		  ,s.bill_payment_processor_id
		  ,s.bill_payment_type_id
		  ,s.transaction_type_id
		  ,biller.country_id
		  ,s.destination_currency_id
		  ,s.min_value
		  ,s.max_value
		  ,s.fixed_value
		  ,s.notes_en
		  ,s.notes_es
		  ,s.bill_payment_biller_service_status_code
		  ,ISNULL(s.use_processor_balance, 0) as use_processor_balance
		  ,ISNULL(s.processor_partial_payments, 0) as processor_partial_payments
		from
			(select top 25 
				biller.bill_payment_biller_id, 
				count(1) as count
			from
				business b with (nolock)
			inner join
				bill_payment_transaction t with (nolock) 
			on 
				b.business_id=t.business_id 
				and t.date_created > @start_date
				and t.transaction_type_id = @transaction_type_id 
			inner join
				bill_payment_biller biller with (nolock) 
			on 
				t.bill_payment_biller_id = biller.bill_payment_biller_id
				and ((@domestic = 1 and biller.country_id = 840) OR (@domestic = 0 and biller.country_id != 840)) 
				and biller.deleted = 0
			where
				b.state_id = @state_id and b.business_type_id=1 
			group by 
				biller.bill_payment_biller_id
			order by 
				count(1) desc) popular
		inner join
			bill_payment_biller biller with (nolock) on biller.bill_payment_biller_id = popular.bill_payment_biller_id
		inner join
			bill_payment_biller_service s with(nolock) ON biller.bill_payment_biller_id = s.bill_payment_biller_id AND s.bill_payment_biller_service_status_code <> 'I'
	END
END


GO


