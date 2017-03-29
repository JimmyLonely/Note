/*	Before	*/

use MoneyTransferCore

select first_name, middle_name, last_name,* from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

update card_holder set self_service = 0 where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

select *  from card_holder_self_service where card_holder_id = 2400

update card_holder set first_name = '', last_name = '' where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

update card_holder set email_address = email_address+ '.old' where email_address = 'jimmyli@augmentum.com.cn'

select *

select business_id from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

select client_options from business
where business_id=2293

1022492139

update business
set client_options=1022492139+131072
where business_id=2293


select * from dbo.receipt where receipt_number = '15092508000057023'

select * from  dbo.bill_payment_transaction where receipt_number = '15092508000057023'


select * from bill_payment_transaction where bill_payment_billing_account_id = 489

select * from bill_payment_transaction where  receipt_number = '15092507100057019'

select * from lu_transaction_status

select * from card_holder where card_holder_id =2465

update card_holder_self_service set sender_level_info_id =3 where  card_holder_id = 2465

select * from dbo.lu_sender_level_info

select * from dbo.rpps_directory_biller where [Biller Key] = 10545

select * from dbo.rpps_directory_biller_mask where [Biller Key] = 10545

/*	2015-09-29	*/

select* from dbo.bill_payment_biller where biller_name = 'AT&T'

select * from dbo.bill_payment_biller_mask where bill_payment_service_id in (17118)

select * from dbo.rpps_directory_biller where [Biller Name] like '%AT&T%'

select * from dbo.rpps_directory_biller_mask where [Biller Key] in (10680,10679)

select * from card_holder where card_holder_id = 2465

select * from card_holder_self_service where card_holder_id = 2465

update card_holder_self_service set sender_level_info_id = 3 where card_holder_id = 2465

/*	2015-09-30	*/

select * from card_holder_self_service

select * from card_holder

select * from business_equipment_self_service where card_holder_id = 2483

update business_equipment_self_service set is_verified = 0 where card_holder_id in

(select card_holder_id from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1)

update application_settings set system_setting_value = 100 where system_setting_key = 'SelfService.ReAuthorizationDevice.ValidationCode.Count'

select system_setting_value,*from application_settings where system_setting_key = 'SelfService.ReAuthorizationDevice.ValidationCode.Count'

select * from card_holder_self_service where card_holder_id = 2483

update card_holder_self_service set sender_level_info_id = 3

/*	2015-10-14	*/

select * from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

select * from card_holder where card_holder_id = 2483

select * from business where business_id = 2303

update business set client_options =1022623211 where business_id = 2303

select * from business where email_address like '%jimmy%'

/*	2015-10-15	*/

use moneytransfercore

select * from card_holder

use [use]

select  user

select * from sysobjects where name = 'usp_rpt_fsa_activity'

select * from syscolumns where name like  '%sales_office_id%'

select * from sysobjects where id = '1863326048'

select * from sysindexes

select * from card_holder

select * from card_holder where email_address like '%jimmyli%' and self_service =1

update card_holder set self_service = 0 where email_address like '%jimmy%'

/*	2015-10-16	*/

use moneytransfercore

select * from business where business_name like '%jayden%'

select * from business_equipment where equipment_name like '%jayden%'

select username,* from MoneyTransferCore.[dbo].[employee] where username ='AUGMENTUM\jayden.zhu'

select * from business where business_id = 1

select * from business_equipment

/*	2015-10-19	*/

use MoneyTransferCore

select * from card_holder

/*	2015-10-23	*/

update business set client_options=142081096
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)

update business set client_options=137886792
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)

/*	2015-10-26	*/

use MoneyTransferCore

select * from card_holder

/*	2015-10-27	*/

use MoneyTransferCore

select serverproperty(N'collation');

/*	2015-10-27	*/

select serverproperty(N'collation');

/*	2015-11-02	*/

use MoneyTransfercore

select * from dbo.promotion

select serverproperty(N'collation');

select * from card_Holder

   
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO

update business set client_options=137886792
 where business_id in (
select business_id from card_holder where email_address= 'sharonli@augmentum.com.cn'
)

select * from business
where business_id in (
select business_id from card_holder where email_address= 'sharonli@augmentum.com.cn'
)

select * from dbo.exchange_rate where rate <1

select * from lu_currency where iso_currency_code_numeric in 
( select to_currency from dbo.exchange_rate where rate <1 )

/*	2015-11-03	*/
USE [MoneyTransferCore]
GO
declare @business_id bigint;
SELECT TOP 1 @business_id = [business_id]
FROM [MoneyTransferCore].[dbo].[business_equipment] where equipment_status_id <> 3 AND equipment_type_id =
10 order by last_updated desc
INSERT INTO [dbo].[business_equipment]
([date_created]
,[last_updated]
,[updated_by_id]
,[created_by_id]
,[created_by_device_id]
,[updated_by_device_id]
,[equipment_status_id]
,[equipment_type_id]
,[equipment_name]
,[equipment_desc]
,[manufacturer]
,[serial_number]
,[part_model_number]
,[our_purchase_price]
,[our_purchase_date]
,[equipment_location_id]
,[mac_address]
,[business_id]
,[business_deposit]
,[business_cost]
,[transaction_date]
,[transaction_type_id]
,[return_date]
,[replacement_cost]
,[employee_id]
,[installation_date]
,[notes]
,[aml_block]
,[aml_watch]
,[application_id]
,[unique_id]
,[wildcard])
SELECT TOP 1
[date_created]
,[last_updated]
,[updated_by_id]
,[created_by_id]
,[created_by_device_id]
,[updated_by_device_id]
,[equipment_status_id]
,[equipment_type_id]
,[equipment_name]
,[equipment_desc]
,[manufacturer]
,[serial_number]
,[part_model_number]
,[our_purchase_price]
,[our_purchase_date]
,[equipment_location_id]
,'C8:1F:66:0F:5E:C7' -- like 'A4:1F:72:7C:66:D5'
,[business_id]
,[business_deposit]
,[business_cost]
,[transaction_date]
,[transaction_type_id]
,[return_date]
,[replacement_cost]
,[employee_id]
,[installation_date]
,[notes]
,[aml_block]
,[aml_watch]
,[application_id]
,[unique_id]
,[wildcard]
FROM [MoneyTransferCore].[dbo].[business_equipment] where equipment_status_id <> 3 AND equipment_type_id =
10 order by last_updated desc
INSERT INTO [dbo].[employee]
([employee_type_id]
,[business_id]
,[manager_id]
,[employee_status_code]
,[date_created]
,[last_updated]
,[updated_by_id]
,[created_by_id]
,[created_by_device_id]
,[updated_by_device_id]
,[first_name]
,[middle_name]
,[last_name]
,[address1]
,[address2]
,[city]
,[state_id]
,[zipcode]
,[country_id]
,[email_address]
,[nick_name]
,[ssn]
,[username]
,[password]
,[security_question_id]
,[security_answer]
,[home_phone_number]
,[cell_phone_number]
,[work_phone_number]
,[work_phone_number_extension]
,[ofac_status_code]
,[ofac_false_positive_reason_id]
,[aml_block]
,[aml_watch]
,[is_pos_admin]
,[can_login]
,[date_of_birth]
,[id_type_id]
,[id_number]
,[nationality_country_id]
,[id_state_id]
,[id_expiration_date]
,[city_id]
,[password_force_reset]
,[password_is_temporary]
,[super_user]
,[shadow_user]
,[floating])
SELECT TOP 1
[employee_type_id]
,[business_id]
,[manager_id]
,[employee_status_code]
,[date_created]
,[last_updated]
,[updated_by_id]
,[created_by_id]
,[created_by_device_id]
,[updated_by_device_id]
,[first_name]
,[middle_name]
,[last_name]
,[address1]
,[address2]
,[city]
,[state_id]
,[zipcode]
,[country_id]
,[email_address]
,[nick_name]
,[ssn]
,'Jimmy' -- like 'augmentum\daniel.yu'
,[password]
,[security_question_id]
,[security_answer]
,[home_phone_number]
,[cell_phone_number]
,[work_phone_number]
,[work_phone_number_extension]
,[ofac_status_code]
,[ofac_false_positive_reason_id]
,[aml_block]
,[aml_watch]
,[is_pos_admin]
,[can_login]
,[date_of_birth]
,[id_type_id]
,[id_number]
,[nationality_country_id]
,[id_state_id]
,[id_expiration_date]
,[city_id]
,[password_force_reset]
,[password_is_temporary]
,[super_user]
,[shadow_user]
,[floating]
FROM MoneyTransferCore.[dbo].[employee] WHERE business_id = @business_id AND employee_status_code <> 'D'
ORDER BY last_updated DESC

select client_options, * from business where business_id = 1662

update business set client_options = client_options | 524288 where business_id = 1662

/*	2015-11-04	*/

use moneytransferCore

update business set client_options=142081096 -131072
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn'
)

select client_options from business 
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn'
)

select * from payment_method where card_holder_id = 2193


update business set client_options=142081096 - 131072
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)

use moneyTransferCore

select * from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1

/*	2015-11-09	*/

use MoneyTransferCore

select * from payment_method 

select * from lu_payment_type 

select * from card_holder_self_service

update  card_holder_self_service set sender_level_info_id = 1 where card_holder_id =2185

select client_options, * from business where  business_id = 2295

update business set client_options = client_options | 0x100000 where  business_id = 2295

update business set client_options=142081096
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)

use Moneytransfercore

/*	2015-11-11	*/

use MoneyTransfercore

select * from dbo.payment_method

select sender_level_info_id, * from card_holder_self_service
where card_holder_id in (
select card_holder_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)

update card_holder_self_service set sender_level_info_id = 2  
where card_holder_id in (
select card_holder_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)

/*	2015-11-12	*/

select card_holder_id, * from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1

update card_holder set self_service = 0 where email_address= 'jimmyli@augmentum.com.cn' and  self_service = 1

update business set  client_options = client_options & (~131072) where business_id = 2296

select client_options|131072, * from business where business_id = 2293

update business set client_options = client_options - 131072 where business_id = 2293

select * from dbo.lu_sender_level_info

select business_equipment_id , 
       business_id ,
	   equipment_status_id , 
	   equipment_type_id,* 
from [MoneyTransferCore].[dbo].[business_equipment] 
where equipment_status_id = 1 AND equipment_type_id in(1,11) and business_equipment_id in (366,369);

update business_equipment set equipment_type_id =11 where business_equipment_id = 369

select business_id, * from [MoneyTransferCore].[dbo].[business] where business_type_id = 1

update MoneyTransferCore.[dbo].[business] set allow_pos = '1' WHERE [business_id] = 1642

update [MoneyTransferCore].[dbo].[business_equipment] set equipment_location_id = 1
where business_equipment_id =369

update [MoneyTransferCore].[dbo].[business_equipment] set equipment_location_id = 2
where business_equipment_id=366

update [MoneyTransferCore].[dbo].[business_equipment]  
set mac_address = 'C8:1F:66:0F:5E:C7'
where business_equipment_id in (366,369)

select employee_id,
       business_id,
       employee_status_code,
       username,
       password,* 
from [MoneyTransferCore].[dbo].[employee] 
where business_id = 1642 AND employee_status_code <> 'D'

for example we got  (employee_id = 164)

update [MoneyTransferCore].[dbo].[employee]
set username = 'jimmy',  
    password = '9vNKkwxkVJi7a75lj8XZfIXJXpc='
where employee_id = 164


update [MoneyTransferCore].[dbo].[card] 
set expiration_date =cast('2100-08-06 20:13:28.703' as datetime) 
where card_number='6274910001020813'

/*	2015-11-16	*/

jimmyli@augmentum.com.cn

use MoneyTransferCore

update card_holder set email_address = 'a2@augmentum.com.cn' where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

select

/*	2015-11-17	*/

select * from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1

select * from card_holder_self_service where card_holder_id = 2200

update card_holder_self_service set is_verified = 1  where card_holder_id = 2216

update card_holder_self_service set sender_level_info_id = 2  where card_holder_id = 2214

SELECT top 100 receipt_number, amount_to_send, receiver_card_holder_id, * from dbo.send_money_transaction where sender_card_holder_id in (2214)  order by date_created desc

update send_money_transaction set date_created = '2015-5-19 11:21:17.513', last_updated = '2015-5-19 11:21:17.800', local_transaction_time = '2015-7-19 06:21:17.513'   where sender_card_holder_id in (2214) 

/*	2015-11-18	*/

select * from lu_sender_level_info

select * from card_holder  where  email_address = 'a@a.com'

select * from business_equipment_self_service where card_holder_id = 2214

/*	2015-11-19	*/

select * from dbo.promotion order by end_date desc

update promotion set end_date = '2016-06-02 06:38:46.690' where promotion_id = 169

select * from dbo.lu_promotion_status

select * from dbo.payment_method


select * from business_equipment_self_service where card_holder_id =
(
select card_holder_id  from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1
)

/*	2015-11-20	*/

update business set client_options=137886792
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)

select c.city, c.stateid from(select distinct name as city, state_id as stateid from locations_mexico union select distinct popular_name as city, state_id as stateid from locations_mexico) c where c.city != ''

select  * from business  where client_options&131072!= 131072

update business set client_options = client_options | 131072

/*	2015-11-20	*/

select * from dbo.audit_log

select * from business_equipment_self_service where card_holder_id =
(
select card_holder_id  from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1
)


delete  dbo.audit_log

update card_holder_self_service set is_verified = 1 where card_holder_id =
(
select card_holder_id  from card_holder where email_address = 'jimmyli@augmentum.com.cn' and self_service = 1
)
