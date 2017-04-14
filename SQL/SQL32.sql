use moneytransfercore


/*	Delete account*/
update card_holder set email_address = 'dafadffdafcom' where email_address like 'j_@a.com' and self_service = 1

select * from card_holder where email_address like 'jimmyli@augmentum.com.cn' and self_service = 1


/*	Verify email*/
update card_holder_self_service set is_verified = 1 where card_holder_id in
(
	select top 20 card_holder_id from card_holder where self_service = 1 and first_name ='' order by date_created desc
)

/*	Verify email*/
update card_holder_self_service set is_verified = 1 where card_holder_id in
(
	select card_holder_id from card_holder where self_service = 1 and email_address like 'j1@a.com'
)

use MoneyTransferCore
/*	Get validation code*/ 
select  top 10 email_address, validation_code, is_verified, s.date_created from self_service_device_card_holder_xref s 
	left join card_holder c
		on s.card_holder_id = c.card_holder_id
	order by s.date_created desc
	
	
use moneytransfercore
/*	Get validation code*/ 
select  top 10 email_address, validation_code, is_verified, s.date_created from self_service_device_card_holder_xref s 
	left join card_holder c
		on s.card_holder_id = c.card_holder_id
		and c.email_address = 'P@1.com'
	order by s.date_created desc


select * from card_holder where card_holder_id in (82569,82568)



select card_holder_id from card_holder where self_service = 1 and email_address like 'j120@a.com'


update card_holder set card_holder_status_code = 'A' where card_holder_id = 82173

select * from card_holder_self_service where card_holder_Id = 82173


select cell_phone_number,*,cell_phone_number from card_holder where email_address = 'jimmyli@augmentum.com.cn'

update card_holder set cell_Phone_number = 111111 where card_holder_Id = 82173

update card_holder_self_service set sender_level_info_id = 3 where card_holder_self_service_id = 1064

update card_holder set [password] = '3bSNKIiMiOZZgOAI3nABwoVwwRo=' where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1


	
	
	
select * from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

Update card_holder set card_holder_status_code = 'A' where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1
	
/* Open Bill Pay*/
update business set client_options=137886792
 where business_id 
 in (
select business_id from card_holder where email_address= 'j2@a.com'and self_service = 1
)

select client_options from business
 where business_id 
 in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn'  and self_service = 1
)


/* Open Bill Pay LCR*/
update business set client_options=142081096
 where business_id in (
select business_id from card_holder where email_address= 'j2@a.com'  and self_service = 1
)

/*	Get beforedob validation code*/ 
/*	Get validation code*/ 
select  * from self_service_device_card_holder_xref where card_holder_id = (
	select card_holder_id from card_holder where email_address = 'jimmyli@augmentum.com.cn'
) order by date_created desc


select * from business_equipment_self_service where validation_code = 379283

/*	Others*/

/*	Delete account*/
update card_holder set email_address = 'dob1aaa1111@a.com' where email_address = 'dob@a.com' and self_service = 1

/*	Verify email*/
update card_holder_self_service set is_verified = 1 where card_holder_id =
(
	select card_holder_id  from card_holder where email_address = 'dob@a.com' and self_service = 1
)


select top 100 * from business_equipment_self_service order by validation_code_date_created desc

/*	Get validation code*/ 
select * from business_equipment_self_service where card_holder_id = (
	select card_holder_id from card_holder where email_address = 'immonenxu@augmentum.com.cn'
) order by validation_code_date_created desc

/* Open Bill Pay LCR*/
update business set client_options=142081096
 where business_id in (
select business_id from card_holder where 
email_address= 'dob@a.com' and self_service = 1
)


/*	Verify email*/
update card_holder_self_service set is_verified = 1 where card_holder_id =
(
	select card_holder_id  from card_holder where email_address = 'dob@a.com' and self_service = 1
)




------Get all limits of Mexico

select p.payout_limit_id, p.transaction_type_id, p.card_holder_type_id, p.business_id, p.amount, p.payment_type_id,
a.limit_type_id, a.limit_type_name, a.limit_period_type_id, a.limit_period_unit_type_id, b.limit_period_unit_type_name, b.date_based
from payout_limit p
inner join lu_limit_type a on a.limit_type_id = p.limit_type_id
inner join lu_limit_period_unit_type b on a.limit_period_unit_type_id = b. limit_period_unit_type_id
where p.card_holder_type_id = 5 
and p.business_id in (
select b.business_id from transaction_destination s
inner join business b on b.business_id = s.destination_business_id 
where s.iso_currency_code_numeric = 484
)
select b.business_id, b.business_name, b.country_id, l.country_name , b.money_transfer_processor_id
from lu_country l
inner join business b on l.country_id = b.country_id
where b.business_id = 3561
select * from payout_limit
update payout_limit
set amount = '10000'
where payout_limit_id = 319




select username, * from employee where username like '%leo%'

select * from employee where employee_id = 544

select * from business where business_id =1662

select mac_address, *from business_equipment where business_equipment_id =544

select business_equipment_id , 
       business_id ,
	   equipment_status_id , 
	   equipment_type_id,* 
from [MoneyTransferCore].[dbo].[business_equipment] 
where equipment_status_id = 1 AND equipment_type_id in(1,11) and mac_address = 'C8:1F:66:0F:5E:C7'

select business_equipment_id , 
       business_id ,
	   equipment_status_id , 
	   equipment_type_id,
	   equipment_location_id, * from business_equipment where mac_address = 'C8:1F:66:0F:5E:C7'

update business_equipment set equipment_location_id = 2 where business_equipment_id = 494

select mac_address, *from business_equipment where business_equipment_id in(494,497)

select business_id, * from [MoneyTransferCore].[dbo].[business] where business_type_id = 1 and business_id = 1662

select employee_id,
       business_id,
       employee_status_code,
       username,
       password,* 
from [MoneyTransferCore].[dbo].[employee] 
where business_id = 1662 AND employee_status_code <> 'D'

update [MoneyTransferCore].[dbo].[employee]
set username = 'jimmy',  
    password = '9vNKkwxkVJi7a75lj8XZfIXJXpc='
where employee_id = 513


select  card_number,
        card_holder_type_id,
        card_holder_status_code,*
from [MoneyTransferCore].[dbo].[card_holder]
where card_holder_type_id = 4 and card_holder_status_code = 'A'

/*	2015-11-16	*/
select * from card_holder where email_address = 'joannagu@augmentum.com.cn'

select top 100 * from  dbo.audit_log where entry_type = 'exception'and username=  'jimmyold@augmentum.com.cn'

update card_holder set email_address = 'jimmyli@augmentum.com.cn.old' where email_address = 'jimmyli@augmentum.com.cn'

select * from promotion where promotion_name like 'test'


select * from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

select * from business_equipment_self_service where card_holder_id =
(
select card_holder_id  from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1
)

update card_holder_self_service set sender_level_info_id = 2  where card_holder_id = 2222

SELECT top 100 receipt_number, amount_to_send, receiver_card_holder_id, * from dbo.send_money_transaction where sender_card_holder_id in (2222)  order by date_created desc

update send_money_transaction set date_created = '2015-6-19 11:21:17.513', last_updated = '2015-6-19 11:21:17.800', local_transaction_time = '2015-7-19 06:21:17.513'   where sender_card_holder_id in (2222) 

select state_id, * from card_holder where email_address = 'jimmyli@augmentum.com.cn'

select * from dbo.bill_payment_processor_request_log

select top 100 * from [MoneyTransferLogs].[dbo].[audit_log] where event_name like '%AuthorizationDevice%' and username ='pmehray@fssdcorp.com'


select * from bill_payment_billing_account where bill_payment_billing_account_id = 6243


update card_holder set email_address = 'dfdsfsdfa@a.fdafcom' where email_address like '%dob%' 

select * from card_holder_self_service where card_holder_id = 80472

update card_holder_self_service set sender_level_info_id = 3  where card_holder_self_service_id = 337

select * from receipt

select * from lu_transaction_type

select * from MoneyTransferCore.[dbo].[send_money_transaction]  where receipt_number = 16033111100339761  

select * from receipt

select confirmation_number from MoneyTransferCore.[dbo].[send_money_transaction_delivery]

select * from lu_payment_type

select * from lu_transaction_type

select * from [dbo].[vw_self_service_pos_transaction_report]   where  [Sender Name] = 'Jimmy Lee'


select * from card_holder where email_address='jimmyli@augmentum.com.cn' and self_service=1

select * from send_money_transaction where sender_card_holder_id = 80896

select * from MoneyTransferCore.[dbo].[send_money_transaction_delivery] where send_money_transaction_id = 61269

/*Pin*/
select confirmation_number from MoneyTransferCore.[dbo].[send_money_transaction_delivery] where send_money_transaction_id = 
(
	select send_money_transaction_id from send_money_transaction where receipt_number = 16040806400339762  /*Receipt Number*/
)  

select * from MoneyTransferCore.dbo.bill_payment_transaction


select card_holder_id  from card_holder where email_address like '%i4%' and self_service = 1


select business_id,* from card_holder where card_holder_id =79350

/*Audit log*/

use moneytransferlogs

select  top 1000 audit_data, event_name, username, datetime_created ,* from audit_log 
where username= 'immonenxu@augmentum.com.cn' and entry_type = 'exception' --order by datetime_created desc


select  top 1000 audit_data, event_name, username, datetime_created from audit_log 
where event_name= 'SelfServiceSendTransactionDetailsEmail' order by datetime_created desc

 select * from bill_payment_billing_account order by bill_payment_billing_account_id desc
 
 select * from MoneyTransferCore.[dbo].[payment_method]
 
 
 UPDATE MoneyTransferCore.[dbo].[payment_method]  SET 
 [card_number_token]='11111111111111111',
 [card_holder_id]= 81262,
 [payment_method_type_id]=4,
 [payment_method_status_code]='I',
 [account_routing_number]='123412341',
 [card_nick_name]=null,
 [card_name]='testss',
 [expiration_date]= getdate(),
 [is_default]=false,
 --[date_created]=@date_created,
 --[last_updated]=@last_updated,
 --[created_by_id]=@created_by_id,
 --[updated_by_id]=@updated_by_id,
 --[created_by_device_id]=@created_by_device_id,
 --[updated_by_device_id]=@updated_by_device_id,
 [address1]="1600 Pennsylvania Ave NW",
 [address2]=null,
 [city]="Washington",
 [state_id]=8,
 [zipcode]='20500',
 [country_id]=840,
 [reference_id]=null,
 [business_equipment_self_service_id]=6271,
 [card_type]=null,
 [added_ip_address]="192.168.232.84",
 [updated_ip_address]="::1",
 [geo_position]=null  WHERE Payment_Method_Id = 1145
 
 
 
 
--rpps/nomal

select * from rpps_billing_account order by date_created desc    -- service type: standard, n:1
select * from rpps_directory_biller

--advance
select * from bill_payment_billing_account  --service type: next day /same day  n:1
select * from bill_payment_biller

select * from bill_payment_billing_account   order by date_created desc


select card_holder_id, transaction_type_id, * from bill_payment_billing_account where card_holder_id =81569 and transaction_type_id = 11 and deleted = 0  

--LCR: rpps & advance









select * from lcr_biller_group_member 

select * from card_holder where card_holder_type_id = 4


update card_holder set business_id = 3715
where card_number = 1111110000002635

select * from card_holder where email_address = 'jj@a.com'


select * from bill_payment_service_required_info where bill_payment_service_id = 6707


select * from bill_payment_service_required_info where bill_payment_service_id = 1439

select * from bill_payment_service_required_info where bill_payment_service_id = 3736

update bill_payment_service_required_info set bill_payment_service_id = 3736 where bill_payment_service_id = 1439 


select top 100 * from bill_payment_billing_account_additional_info where bill_payment_billing_account_id=1445


select top 100 * from bill_payment_billing_account_additional_info where bill_payment_billing_account_id=3731


UpdateAdvancedBillingAccountAdditionalInfo

select top 100 * from dbo.bill_payment_billing_account where bill_payment_billing_account_id=1445

select top 100 * from dbo.bill_payment_billing_account where bill_payment_billing_account_id = 3731

select * from bill_payment_billing_account where account_number = '212121211'

select * from rpps_billing_account where account_number = '212121211' 



select * from bill_payment_billing_account order by last_updated desc



select * from bill_payment_billing_account_additional_info where bill_payment_billing_account_id=5463

update bill_payment_billing_account_additional_info set mobile_phone = null, pin = null, email = null  where bill_payment_billing_account_id=5012 

update bill_payment_billing_account_additional_info_history set mobile_phone = null, pin = null, email = null  where bill_payment_billing_account_id=5012

select * from bill_payment_billing_account_additional_info_history where bill_payment_billing_account_id=5463

select * from bill_payment_service_required_info


select 1, * from lu_bill_payment_info_field

select * from bill_payment_service_required_info where bill_payment_service_id = 5463




select * from bill_payment_service_required_info where bill_payment_service_id = 823

select * from bill_payment_service_required_info where bill_payment_service_id = 13062

select * from re

select * from lu_bill_payment_info_field


update bill_payment_service_required_info set bill_payment_service_id = 823 where bill_payment_service_id = 13060


update bill_payment_service_required_info set bill_payment_service_id = 13060 where bill_payment_service_id = 823



select bill_Payment_service_id, * from MoneyTransferCore.[dbo].[bill_payment_billing_account] where Bill_Payment_Billing_Account_Id = 5498

select * from card_holder where card_holder_id = -1

select * from MoneyTransferCore.[dbo].[rpps_billing_account] where rpps_billing_account_id = 1644


select * from lu_transaction_type



select * from lu_card_holder_type

select  * from card_holder where employee_id = 3479

select [password],* from employee where employee_id = 3481 or employee_id = 3480

update employee set super_user = 0, shadow_user=0, password_force_reset =0, password_is_temporary=0,floating=0 where employee_id = 3481

update employee set employee_status_code = 'A' where employee_id = 3481 or employee_id = 3480


select * from MoneyTransferCore.[dbo].[employee_security_question] where employee_id = 3480 and answer = 5

select * from lu_employee_status


select * from MoneyTransferCore.[dbo].[employee] where employee_id = 3480

update employee set email_address = 'jimmyli@augmentum.com.cn' where employee_id = 3480

update employee set employee_status_code = 'A' where employee_id = 3480

 
select customer_name , * from MoneyTransferCore.[dbo].[bill_payment_billing_account] where bill_payment_billing_account_id = 4796


select * from card_holder

select * from lu_card_holder_status

select  card_holder_status_code, * from card_holder where email_address= 'jimmyli@augmentum.com.cn'  and self_service = 1


update card_holder set card_holder_status_code = 'I'
where email_address= 'jimmyli@augmentum.com.cn'  and self_service = 1


update card_holder set card_holder_status_code = 'A'
where email_address= 'jimmyli@augmentum.com.cn'  and self_service = 1


execute [MoneyTransferCore].[dbo].[usp_get_express_biller]

select bill_payment_biller_service_status_code,* from bill_payment_biller_service where bill_payment_service_id = 65

select * from lu_transaction_type

select * from MoneyTransferCore.[dbo].[core_fee] where total_value <0


select top 100 * from  dbo.audit_log where entry_type = 'exception' where


select * from MoneyTransferCore.[dbo].[bill_payment_billing_account] where bill_payment_billing_account_id = 5920

select * from MoneyTransferCore.[dbo].[rpps_billing_account] where rpps_billing_account_id = 5920



select * from program

update business set program_id=2  where business_id=35

 
select * from payment_method where payment_method_id = 1611

select address1, * from payment_method where card_holder_id = 82173 and payment_provider_id =2

select * from lu_payment_provider

select * from payment_provider_config

update payment_provider_config set payment_provider_id  =2

select * from MoneyTransferCore.[dbo].[lu_carousel_page] where carousel_page_id = 1

select [MoneyTransferCore].[dbo].[usp_find_matching_express_billers_self_service]

select * from bill_payment_biller_service

select * from bill_payment_biller_address

select *from bill_payment_biller_service

select * from bill_payment_biller_mask mask

select * from bill_payment_biller where biller_name like '%Guat%'

-- 12952
select * from bill_payment_biller where bill_payment_biller_id = 12952

-- Claro Guatemala
select * from bill_payment_biller where biller_name = 'Claro Guatemala'

update bill_payment_biller set biller_name = '[Guatemala] Claro' where bill_payment_biller_id = 12952

update bill_payment_biller set biller_name = '[Guatemala] Claro' where biller_name = 'Claro Guatemala'

select * from vw_self_service_pos_transaction_report where [Receiver Name] = '%\%' 

select * from vw_self_service_pos_transaction_report where [Receiver Name] like '%/[%' escape '/'

select * from vw_self_service_pos_transaction_report where [Receiver Name]  = 


declare @escape_char char
set @escape_char='/'

declare @expression varchar(50)
set @expression= '[Gua'

declare @pattern varchar(50)

declare @replacement


set @expression = '/[Gua'
--set @expression=REPLACE(@expression, @pattern, @replacement)

select * from vw_self_service_pos_transaction_report where [Receiver Name] like '%'+@expression+'%' escape @escape_char


select * from business_equipment_self_service where business_equipment_id = 8208



select * from MoneyTransferCore.[dbo].[carousel_source] where client_type_id =1 and carousel_page_id =1


select * from carousel_source where carousel_source_type_id =1



select * from lu_client_type

update carousel_source set [source]='http://localhost:3521/assets/img/mobile-portrait-slide444-bg.jpg' where carousel_source_id =22 

select * from lu_country

select * from business where  business_type_id =8  

and self_service = 1 

and business_status_code = 'A'

order by country_id 


select * from business where  country_id = 32 and business_type_id =8  and business_status_code = 'A'

update business set business_status_code = 'A' where  country_id = 32 and business_type_id =8

select * from lu_business_status 

 

select * from lu_business_type

select * from carousel_source where carousel_source_type_id = 2



select * from lu_client_type

select * from lu_carousel_source_type

--	<img src="assets/img/icon-moneytransfer.png" class="icon-money-transfer">
--	<img src="assets/img/icon-billpay.png" class="icon-bill-pay">
--	<img src="assets/img/icon-topups.png" class="icon-top-ups">
--	<img src="assets/img/icon-referral.png" class="icon-referrals">


--	<img src="assets/img/icon-moneytransfer@2x.png" class="icon-money-transfer">
--	<img src="assets/img/icon-billpay@2x.png" class="icon-bill-pay">
--	<img src="assets/img/icon-topups@2x.png" class="icon-top-ups">
--	<img src="assets/img/icon-referral@2x.png" class="icon-referrals">

--	https://qaminiss.unidosfinancial.com/assets/img/bill-pay.png


-- Web
update carousel_source set [source] = '<img src="assets/img/icon-moneytransfer.png" class="icon-money-transfer">' where  carousel_source_id = 2
update carousel_source set [source] = '<img src="assets/img/icon-billpay.png" class="icon-bill-pay">' where  carousel_source_id = 5
update carousel_source set [source] = '<img src="assets/img/icon-topups.png" class="icon-top-ups">' where  carousel_source_id = 8
update carousel_source set [source] = '<img src="assets/img/icon-referral.png" class="icon-referrals">' where  carousel_source_id = 11

--	Wrapper
update carousel_source set [source] = 'https://qaminiss.unidosfinancial.com/assets/img/icon-moneytransfer.png' where  carousel_source_id = 14
update carousel_source set [source] = 'https://qaminiss.unidosfinancial.com/assets/img/icon-billpay.png' where  carousel_source_id = 17
update carousel_source set [source] = 'https://qaminiss.unidosfinancial.com/assets/img/icon-topups.png' where  carousel_source_id = 20
update carousel_source set [source] = 'https://qaminiss.unidosfinancial.com/assets/img/icon-referral.png' where  carousel_source_id = 23

--	MobileWeb
update carousel_source set [source] = '<img src="assets/img/icon-moneytransfer.png" class="icon-money-transfer">' where  carousel_source_id = 26
update carousel_source set [source] = '<img src="assets/img/icon-billpay.png" class="icon-bill-pay">' where  carousel_source_id = 29
update carousel_source set [source] = '<img src="assets/img/icon-topups.png" class="icon-top-ups">' where  carousel_source_id = 32
update carousel_source set [source] = '<img src="assets/img/icon-referral.png" class="icon-referrals">' where  carousel_source_id = 35




select * from lu_carousel_page

Es bueno tener amigos! Gana $25 por cada uno que refieras


Es bueno tener amigos!<p>Gana $25 por cada uno que refieras<p>

update lu_carousel_page set carousel_page_type_name_en = 'Es bueno tener amigos!<p>Gana $25 por cada uno que refieras<p>' where lu_carousel_page_id = 4


select * from  
dbo.promotion



select * from dbo.audit_log where entry_type = 'exception'


select * from card_holder_self_service where

SELECT * from bill_payment_transaction where receipt_number = '16101707200339731'
SELECT * FROM rpps_bill_pay_transaction where receipt_number = '16101707200339731'
SELECT * From send_money_transaction  where receipt_number = '16101707200339731'


select top 100 * from [MoneyTransferLogs].[dbo].[audit_log] 
where username = 'sgbackoffice+1515@gmail.com' and entry_type = 'exception'


select * from rpps_billing_account order by rpps_billing_account_id desc

select * from bill_payment_billing_account order by bill_payment_billing_account_id desc


select * from lu_payment_type



select client_options, * from business 
 where business_id 
 in (
select business_id from card_holder where email_address= 'dob1@a.com'  and self_service = 1
)


select business_id, card_holder_id from card_holder where email_address= 'dob@a.com'  and self_service = 1

select * from lu_transaction_status


select * from vw_self_service_pos_transaction_report


vw_self_service_pos_transaction_report

ufn_get_transaction_history_status_self_service


select * from lu_transaction_status

select * from lu_pos_transaction_status

sp_help vw_self_service_pos_transaction_report


sp_helptext usp_get_express_billers



use moneytransfercore

select bill_payment_biller_id, * from bill_payment_billing_account where bill_payment_billing_account_id = 1234

select * from bill_payment_biller where bill_payment_biller_id = (
	
)

select bill_payment_biller_service_status_code, * from bill_payment_biller_service where bill_payment_service_id = (
	select bill_payment_service_id from bill_payment_billing_account where bill_payment_billing_account_id = 7851
)

select bill_payment_biller_service_status_code, * from bill_payment_biller_service where bill_payment_service_id = (
	select bill_payment_service_id from bill_payment_billing_account where bill_payment_billing_account_id = 7854
)


select * from bill_payment_biller_service where bill_payment_biller_service_status_code = 'I'

select * from lu_transaction_type

select * from lu_bill_payment_biller_service_status


select bill_payment_biller_service_status_code, * from bill_payment_biller_service where bill_payment_service_id = 14293

select * from MoneyTransferCore.[dbo].[self_service_referral]



--ID document expired

update document_self_service set expiration_date = '2016-12-30 08:04:43.513' 
select * from document_self_service where sender_document_record_id = 17

select * from sender_document_record_self_service where card_holder_id = 82678


select * from lu_document_status_self_service

update sender_document_record_self_service set status_id = 4 where sender_document_record_id = 17



select top 100 * from  dbo.audit_log where username=  'j1@a.com' order by datetime_created desc

select top 100 * from self_service


select * from business where business_id = 3672

/* For IBV */
insert into vendor_cost_detail values(4, 1, GETUTCDATE(), GETUTCDATE(), 3397, 3196, 0.1)

insert into vendor_cost_detail values(5, 1, GETUTCDATE(), GETUTCDATE(), 3397, 3196, 0.1)

select * from vendor_cost_detail

select card_holder_id,* from card_holder where self_service = 1 and email_address like 'bug8577@a.com'


EXEC sp_defaultdb 'sa' , 'MoneyTransferCore'

select * from lu_country

select * from exchange_rate where rate = null

update exchange_rate set rate = null where to_currency = 156

select * from business_equipment_self_service where business_equipment_self_service_id != null


select * from batch_transaction with(nolock) where transaction_type_id = 1 order by batch_transaction_id desc


select * from lu_batch_status

select * from lu_transaction_status



select *  from cash_batch_transaction with(nolock) order by cash_batch_transaction_id desc



select * from send_money_transaction where receipt_number = 17032901100339701  order by date_created desc

select * from send_money_transaction_delivery where send_money_transaction_id = 63375

select * from pos_transaction_status_xref where transaction_status_code = 'F' and transaction_type_id = 14



select * from sender_document_record_self_service where card_holder_id = 89847 AND sender_level_info_id = 2 AND status_id IN ( 1 , 2)


select * from card_holder_self_service where card_holder_id = 89847


select * from sender_document_record_self_service where card_holder_id = 89847