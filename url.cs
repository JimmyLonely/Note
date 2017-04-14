design
http://192.168.232.101/unidos/Build20150810/consumer/customer/customer-dashboard.html

http://192.168.1.100/trac/Unidos/ticket/166     penny.tao   abc123_

http://clients.lakanastudios.com/ufs/unidos-consumer.html  

static page 
http://clients.lakanastudios.com/ufs/dev/ufs-app-v2.3/

POSV2 Agent
\\192.168.1.19\Development\Nexad\5Temp\taylorliu\self-hosted\20151216 - 1.0.0.9

Demo DemoSupport
\\192.168.1.19\Development\Nexad\5Temp\taylorliu\DemoSupport.zip

BRD
\\192.168.1.19\Development\Nexad\0Project\UIDesign-POSv2-SelfService

Delete kit Files
\\192.168.1.19\Development\Nexad\5Temp\Leo Liu\Delete kit file

UI Script
$/MoneyTransfer/SelfService/Database Scripts/Self Service/Self Service UI

Open BRD 
file:///D:/Local/BRD/codekit/ufs-app-consumer-v2/consumer/on-boarding/login-consumer.html

SL BRD 
\\192.168.1.19\Development\Nexad\0Project\UIDesign-POSv2-SelfService\SL  BRD

VPN
    Augmentum@2017

SL Design
[9:59:14] Leo Liu: 
\\192.168.232.52\SL Design

unidos
[9:53:46] jayden zhu: Designreview!

TFS
    sean.augmentum@outlook.com
    Wh?t-n-H@w

u: unidos
p: Designreview!

//QAMini
52.21.22.19 QAMini01
Domain name: qaminiss.unidosfinancial.com
RDP user: augdev
Password: augtoday@123

// QAWEB01
107.23.22.68 QAWEB01
syi 
T0day$12345


//qadb
ssuatsql01

10.10.90.41
mts_app_pos
today_123

mac_address
	C8:1F:66:0F:5E:C7

    sharon li
        A4:1F:72:7D:C7:C1

teamcity
	http://192.168.232.32:9090
	penny.tao  abc123_

card_account
		4024188771601470
		4024076144762501
		

   	RoutingNumber
   		123456780

jimmyli@augmentum.com.cn

11111111

123456789012345678901234567890abc@china.china.china.china.china.china.china.china.china.china.china.com

C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Dat

https://smartystreets.com/docs/address
    address： 1600 Pennsylvania Ave NW
    State  District Of Columbia
    City; Washington
    Zip Code: 20500

    address：6009 Westline Dr.
    State  Texas
    City; Houston
    Zip Code: 20500

    205 Jesse Hill Jr Dr SE     
    Georgia    
    Atlanta   
    30334

    5418 N Western Ave, 
    Oklahoma City, 
    OK, 73118



233 Fountain Blvrd
Chicago

4 Mann St Ste 4       Irvine   CA    92612

POSV2
    1111 1100 0000 0357
    MoneyTransfer.WebService

    local
    	6274910001020813

    1022623211

SELECT DB_ID('MoneyTransferCore')


client_options
    
    MoneyTransfer 65544
    bill pay      137886792   
    bill pay lcr  142081096 



SELECT * FROM sysprocesses
where dbid=14

kill 51


 Modify bill pay or bill pay lcr
  

update business set client_options=137886792
 where business_id in (
select business_id from card_holder where email_address= 'jimmyli@augmentum.com.cn' and self_service = 1
)


!!!! Modify bill pay or bill pay lcr
--bill pay     137886792   
--bill pay lcr 142081096   

update business set client_options=137886792
 where business_id in (
select business_id from card_holder where email_address= 'timluo@augmentum.com.cn'
)

Success Transaction
 BillPay 
 	EEQ
 BillPay lcr
    Cablevision of Monmouth-OceanCablevision of Monmouth-Ocean
    07865123456789

Leo
    http://192.168.232.32:2515/ServiceGateway.Service/ServiceGateway.svc

Promotion Code
    qapromotion

    <a href="http://www.baidu.com" target="_blank">Baidu</a>

abc123_


<a href="http://qasupport.unidosfinancial.com/download/RDMDriverPackage.zip">ZIP</a>


1622
New customer
Express
    topups
    check cashing

Sale Person
    Theme


536870912

epin 1048576

quci 32

1024

Check Cashing 524288


AuthorizationDevice



use master
go

declare @_id bigint

declare @cursor cursor--设定游标欲操作的数据集
set @cursor=cursor for

SELECT spid FROM sysprocesses
where dbid in(SELECT DB_ID('MoneyTransferCore') as id)
open @cursor--打开游标
fetch next from @cursor into @_id--移动游标指向到第一条数据，提取第一条数据存放在变量中
while(@@fetch_status=0)begin--如果上一次操作成功则继续循环
EXEC ('KILL ' + @_id )
fetch next from @cursor into @_id--继续提下一行
end
close @cursor--关闭游标
deallocate @cursor--删除游标


--- smartystreets
use moneytransfercore
go
declare @business_id bigint
declare @value bigint
declare @cursor cursor
set @cursor=cursor for SELECT business_id,client_options&131072 as 'value' FROM business where self_service=1 and state_id in(
select state_id from lu_states
where country_id=840
)

open @cursor--打开游标
fetch next from @cursor into @business_id,@value
while(@@fetch_status=0)
begin
 if(@value=0)
 begin
  update business
  set client_options=client_options+131072
  where business_id=@business_id
 end
 fetch next from @cursor into @business_id,@value
end
close @cursor
deallocate @cursor


-- havrst
unidos-jimmy@augmentum.com
[2015/10/30 17:55:02] jayden zhu: unidos123_


http://clients.lakanastudios.com/ufs/dev/ufs-app-v2.3/consumer/account/account-consumer.html
[12:07:06] Cathy Song: u: unidos
p: Designreview!



Nuget 
    \\192.168.1.19\Development\Nexad\6Software\nuget\Cache

sql server 2008
    localhost\MSSQLSERVER2008

    192.168.232.32\QASQL_32

AutoComplete
    
    https://www.devbridge.com/sourcery/components/jquery-autocomplete/

Share
    \\192.168.1.19\Development\Nexad\5Temp



































































----------------------------------------------Ex-------------------------------------------

    1. SQL server 2005: \\192.168.232.32\01.install packages\en_sql_2005_dev_all_dvd.
 
    2. VS2008: \\192.168.232.32\01.install packages\VS2008.
     
    3. VS2010: \\192.168.232.32\01.install packages\VS2010.
     
    4. IE10: \\192.168.232.32\01.install packages\IE10-Windows6.1-x64-zh-cn.exe
     
    5. VS 2013: \\192.168.232.32\01.install packages\VS2013
     
    6. JRE: \\192.168.1.19\Development\Nexad\6Software\JRE7.
     
    8. 7zip: \\192.168.232.32\01.install packages\7zip920.ex8e
     
    9. SVN 1.8: \\192.168.232.32\01.install packages\TortoiseSVN-1..0.24401-x64-svn-1.8.0.msi.
    10. SVN url  :http://192.168.1.100/Nexad/svn/trunk.
     

    11. TFS url:  https://unidosfinancial.visualstudio.com/DefaultCollection.

    IES 
        http://172.26.20.9/IES/auth/portal/default/default

        http://its.augmentum.com.cn:8006/

    QAMini  \\192.168.232.32\01.install packages\DB\QAMiniSS-Database-20151130

    UI
        \\192.168.1.19\Development\Nexad\5Temp\MatthewQue\MoneyTransfer.UI

    Static page     Ticket #639

    metting recording
        \\192.168.1.19\development\Nexad\2Documents\Meetings

    CreditCard
        www.e4dai.com/tool/CreditCard.asp

        Visa
        MasterCard
        American Express
        Discover


    QAPOSV2
    https://qapos2.unidosfinancial.com/

    52 Build
    192.168.232.52/build

    Service GateWay 
    \\192.168.1.19\Development\Nexad\5Temp\RodChen\PayInGateway


private const string SOAP_EXCEPTION_PREFIX = "System.Web.Services.Protocols.SoapException: 服务器无法处理请求。 ---> ";
        private const string SOAP_EXCEPTION_POSTFIX = "\n   --- 内部异常堆栈跟踪的结尾 ---";


# For QAMini
# 52.21.22.19 	qaminiss.unidosfinancial.com 
# 52.21.22.19	qamts.unidosfinancial.com 
# 52.21.22.19	qaminipos2.unidosfinancial.com 
# 52.21.22.19	qaminicalc.unidosfinancial.com
# 52.21.22.19	qaapi.unidosfinancial.com
# QaMini End





/e /u /wl /dl %6 /dr %7 %1 %2

merge
/e /ub /dl %6 /dr %7 %1 %2 %4


bill_payment_biller_id	bill_payment_service_id	bill_payment_billing_account_id	date_created	last_updated	updated_by_id	created_by_id	updated_by_device_id	created_by_device_id	card_holder_id	bill_payment_service_id	bill_payment_type_id	bill_payment_biller_id	account_name	account_number	customer_name	phone_number	deleted	transaction_type_id	first_name	last_name	is_favorite	area_code
14298	14293	8637	2016-11-21 06:56:50.103	2016-11-21 06:56:50.103	3763	3763	4941	4941	86293	14293	3	14298		012345675	jimmy lee	1111111111	0	11	jimmy	lee	0	NULL

bill_payment_biller_id	biller_name	date_created	last_updated	biller_class_id	country_id	created_by_id	updated_by_id	created_by_device_id	updated_by_device_id	deleted
14298	                CFE Mexico	2013-07-170	    2013-07-1   	17	            484	            3033	    3033	        1270	                1270	                0

bill_payment_service_id	bill_payment_biller_id	bill_payment_processor_id	bill_payment_type_id	bill_payment_service_name	processor_biller_id	processor_biller_sub_code	deleted
14293	                14298	                6	                        3	                    NULL	                    765	                NULL	                    0

destination_currency_id	min_value	max_value	fixed_value	notes_en	notes_es	transaction_type_id	bill_payment_biller_service_status_code	use_processor_balance	processor_partial_payments
484	                                10.00	    999.99	    0.00		            11	                I                                       NULL                    NULL




//  old
http://192.168.1.100/trac/Unidos/query?status=assigned&status=new&
status=reopened&group=owner&component=Member+Level&order=id&fix_in_build=&col=id&
col=summary&col=milestone&col=status&col=type&col=priority&col=component&milestone=Soft+Launch&owner=~sean.li&desc=1

//  Jimmy's track
http://192.168.1.100/trac/Unidos/query?status=assigned&
status=new&status=reopened&group=status&order=changetime&col=id&
col=summary&col=status&col=type&col=priority&col=milestone&col=component&col=changetime&owner=jimmy.li&desc=1

TFS 域名
Account: unidosfinancial.com\jli
Password: Augmentum@2017



http://192.168.232.59:3521/Home/SelfServiceResetPassword?
emailAddress=vNecCXta28BDkTObJRRQyRMNwhCijU0A8gjayTDSqn8%3d
&macAddress=ka976B1WkEbVXIAV1DuMbXL4T1B1Meow
&uniqueCode=hhsb2trOnoPmI4dpZIK0sfijoISgWi3PNpXV3iFmbXfoaWxFRZGtWA%3d%3d



http://192.168.232.161:3521/Home/SelfServiceResetPassword?
emailAddress=VeYS2VNUjbJBfRXoLf%2FsBVfVBg1VbgFTh1qWQKCg12A%3D
&macAddress=ka976B1WkEbVXIAV1DuMbXL4T1B1Meow
&uniqueCode=7tvMd4PclyQ4dhidYQTUT%2BInEOxeIr3MRcNPfITZ7TiMprS8WZdsCA%3D%3D



http://192.168.232.161:3521/Home/SelfServiceResetPassword?
emailAddress=9DyLVGMccnnN85ODcuwNhw%3D%3D
&macAddress=ka976B1WkEbVXIAV1DuMbXL4T1B1Meow
&uniqueCode=yJcaY%2BrbV8LPhJJK9d0J3yoibSh%2B0ccS9QzYkXsv4lDSb4KSBd5Q8A%3D%3D

        private const string SOAP_EXCEPTION_PREFIX = "System.Web.Services.Protocols.SoapException: 服务器无法处理请求。 ---> ";
        private const string SOAP_EXCEPTION_POSTFIX = "\n   --- 内部异常堆栈跟踪的结尾 ---";


Transction taxes fee 
    -> Oklahoma

//Remote
Cmd:        mstsc  
IP:         192.168.232.161
User:       augmentum\jimmy.li
Password:   abc123_

//IBV
YodleeService.cs
ibvCost.Cost = VendorCostLogic.GetCurrentCost(
IbvCostLogic.Add(

//Email
<add key="SelfService.CoreMessaging" value="https://services-dev.unidosfinancial.com/cms/api/"/>


//URL 
Producet
ssdc.unidosfinancial.com

//sengo design Account/Password
sengo
LakanaDevDesign!


//UploadDocument API
http://192.168.232.76:20323/
https://192.168.232.76:44361/

https://services-dev.unidosfinancial.com/Documentum/





<root><child></child></root>



950715