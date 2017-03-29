using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;




Build
http://192.168.232.161:8806/

20161013 design
http://192.168.232.161:8009/


DB: 192.168.232.161\MSSQLSERVER2008
Account/Password: sa/abc123_


Andriod:    "1997-10-20"
IOS:        "1997-10-20"                   
PC (English):  "10/22/1997"     --M/d/y
PC (Spanish):   "10/22/1997"    --D/M/Y
Pad:         "10/22/1997" 


"MM-dd-yyyy"

DateTime.ParseExact

https://msdn.microsoft.com/zh-cn/library/8kb3ddd4(v=vs.110).aspx 





^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$     




/\d{4}\/
([[0]\d{1}]|[1][12])

(([0][1-9])|
([12]\d{1})|
([3][01]))

^\d{4}-([0]\d{1}]|[1][12])-


function GetPaymentTypeFromCache         (countryId, currencyId)
function getPaymentTypeFromCache         (countryId, currencyId)

self.GetPaymentTypesByCityFromCache      (countryId, currencyId, stateId, city)

function getPaymentTypesByCityFromCache  (countryId, currencyId, city)






function addPaymentTypesToCache                 (countryId, currencyId, paymentTypes)
addPaymentTypesToCache                          (countryId, currencyId, paymentTypes)
function addPaymentTypesByCityToCache           (countryId, currencyId, city, paymentTypes)

self.addPaymentTypesByCityToCache = function    (countryId, currencyId, stateId, city, paymentTypes)




        self.deleteAddedCashPickUps = function (cashPickUps, addedCashPickUps) {
            if (!addedCashPickUps || addedCashPickUps == []) {
                return cashPickUps;
            }

            var tempCashPickUps = new Array();
            $.each(cashPickUps, function (index, p) {
                if (p.PaymentTypeId == 6 || addedCashPickUps.indexOf(p.Payouts[0]) == -1) {
                    tempCashPickUps.push(p);
                }
            });

            return tempCashPickUps;
        };

SearchCityChanged editrecipient


Autocomplete:
Y
S:yes

N
Blank: yes

D: disabled
zipType: yes
more than 1 suggestion
















Autocomplete API:
    Valid:                                                                       
        Y
        S

    InValid:
        N
        no Address
        "Blank"

        //D
        zipType

//more than 1 suggestion: no case


Smart Street API:
    Valid: 
        Y
        S

    InValid:
        N
        "Blank"
        dpvFootnotes == zz ?

        D 
        zipType:

//more than 1 suggestion: no case                   



<Entry>-256 Biller was not found: 14298</Entry>

SelfServiceGetBillPaymentExchangeRate

Biller 14298
Biller Service 14293


<Entry>System.NullReferenceException: Object reference not set to an instance of an object.    
 at MoneyTransfer.PosInterface.PosInterfaceFunctions.ProcessServiceGatewayResponse(BillPaymentTransaction billPayTransaction, SGResponse response) 
 in D:\TFS Code\MoneyTransfer-SL-Publish\Self Service SL\POSWebServer\WebService\MoneyTransfer.PosInterface\PosInterfaceFunctions.cs:line 8854     
 at MoneyTransfer.PosInterface.PosInterfaceFunctions.SelfServiceGetBillPaymentExchangeRate(Session session, AuthenticationCredentials posCredentials, PosTransaction transaction) in
  D:\TFS Code\MoneyTransfer-SL-Publish\Self Service SL\POSWebServer\WebService\MoneyTransfer.PosInterface\PosInterfaceFunctions.cs:line 14499     
  at MoneyTransfer.WebService.WebServiceFunctions.<>c__DisplayClass2e8.<SelfServiceGetBillPaymentExchangeRate>b__2e7(Session session, AuthenticationCredentials credentials)     
  at MoneyTransfer.WebService.WebServiceFunctions.ProcessWebRequest[T](WebRequestDelegate`1 webRequest, AuthenticationCredentials posCredentials, DateTime requestStart, Object[] parameters)    
   at MoneyTransfer.WebService.WebServiceFunctions.ProcessWebRequest[T](WebRequestDelegate`1 webRequest, AuthenticationCredentials posCredentials, DateTime requestStart, Object[] parameters)</Entry>






unidossgqa+1@outlook.com / uni12345
Click on Quick Pay of 3rd transaction
Transaction performed on 11/18/2016
still throwing "Your Payment was not successful, please update your Payment Method and try again" error
could you please look into this?


1. Before -Login. Fail on Firefox. You Pay and Fee are remembered while Send and Receive are blank
2. After-Login. Fail on IE. Country drop-down list disappears.
3. The behavior of  Before -Login and After-Login is different.



Toggle Image


<Entry>-423 Regalii Error has occured: No specific error code was returned from Regalii. Details: Couldn't find company</Entry>

SelfServiceLimitHold || 
($parent.SenderLevel() &&
    (
    ($parent.SenderLevel().TargetLevelId == 0 || $parent.SenderLevel().TargetLevelId > $parent.SenderLevel().SenderLevelId) &&
    (
        $parent.SenderLevel().IsDocumentSubmited || $parent.SenderLevel().SelfServiceLimitHold || $parent.SenderLevel().IsUpgradeLater)
    )
)


    (SenderLevelMoney()().TargetLevelId == 0 || SenderLevelMoney()().TargetLevelId > SenderLevelMoney()().SenderLevelId) &&
    (
        SenderLevelMoney()().IsDocumentSubmited || SenderLevelMoney()().SelfServiceLimitHold || SenderLevelMoney()().IsUpgradeLater
    )

We have fixed the issue, but there isn't sliding animation when opening fee calculator page.
Referral page is an app native page, it has sliding animation when opening it from left menu.
Fee calculator is a web page ,it has the same behavior with design page.
@Rajasekhar Jonnalagadda will change fee calculator to native page later, please report other issues to @Rajasekhar Jonnalagadda.



 if_4@a.com
 12341234

                                                         <!-- ko if:levelUpgradeType() == 0 || levelUpgradeType() == 2-->\
                                                        <strong data-bind="commonstring:{data:\'upgrade.upgradeviaemail.upgradetolevel\',asHtml:true,args:{color:\'orange\',level:3}}">Upgrade to <span class="txt-orange">Level 3</span></strong>\
                                                        <!--/ko-->\
                                                        <br>\
                                                        <!-- ko if:levelUpgradeType()levelUpgradeType() == 2-->\
                                                        <span>\
                                                        Submit one Source of Funds Document:\
                                                        </span>\
                                                        <!-- /ko -->\
                                                        <!-- ko if:levelUpgradeType()levelUpgradeType() != 2-->\
                                                        <span data-bind="commonstring:{data:\'upgrade.upgradeviaemail.submitsourceoffund\',asHtml:true}">\
                                                        Submit <u>one</u> Source of Funds Document:\
                                                        </span>\
                                                        <!-- /ko -->\





lizhimin2996@live.com

l1711224524

LoginConsumer
{"IsFirstLogin":false,"CustomerId":87212}

87212

AuthorizationDevice
{"MemberStatus":"A","MemberLevelId":1,"CustomerId":87212}


LoginConsumer and AuthorizationDevice




Track: #1803
Shelveset: Track #1803 - By Jimmy.Li
Under: jli\






Ip              Device                 update_time                                     create_time
10.10.90.37                             2017-01-11 20:44:02.370                 2017-01-11 20:40:27.683
10.10.90.37                             2017-01-11 15:19:43.180                 2017-01-11 15:19:05.680
10.10.90.37                             2017-01-09 20:02:44.790                 2017-01-09 20:02:19.527



The field is boolean, If true, otherwise, we need to pop up one corresponding warning message.

If user set a state without BP licence, should show prompt message and return user to dashboard, too.
Cause, MT licence and BP licence are associated. If customer has not MT licence, customer cannot do BP transaction.
likewise, If customer has no BP license, customer cannot do MT transaction.


2.4800355424 368305996009904185692e+96
1.711224524


#8195
BT 
Initialize
cs.scrollToElement($('.quick-pay-href #quickpay-input-amount'));

self.QuickPayConfirm
CheckAmountIsValid()

LCR 
self.QuickPayCalculate  self.PaymentMethodAPI().lastPaymentMethodId = null;


MT 
self.QuickPayCalculate   delete self.quickPayCalculateExcuting.setExecuting();


data-disable
BP  ['input-promo-code', 'promo-code-apply', 'promo-code-remove', 'bill-pay-confirm-done']
'back-to-amount-send', 'back-to-biller', 'back-to-service-type', 'back-to-payment'
LCR ['input-promo-code', 'promo-code-apply', 'promo-code-remove', 'bill-pay-lcr-confirm-done']
'back-to-amount-input', 'back-to-biller', 'back-to-service-type', 'back-to-payment'

Reload ['input-promo-code', 'promo-code-apply', 'promo-code-remove', 'reload-confirm-checkbox-quick']
'back-to-amount-send', 'back-to-carrier', 'back-to-payment'
Pinless ['input-promo-code', 'promo-code-apply', 'promo-code-remove', 'top-ups-confirm-done']

'back-to-amount-send', 'back-to-carrier', 'back-to-payment'

MT ['quick-pay-edit-receiver', 'quick-pay-edit-delivery-option', 'quick-pay-edit-payment','input-promo-code', 'promo-code-apply', 'promo-code-remove', 'money-transfer-confirm-done']



{
    "error": "InternalServerError", 
    "reason": "La liga ha expirado. Solicita una nueva liga dando click en "¿Olvidaste tu contraseña?" ubicada en la página de registro.",
     "exceptionCode": "-470"
}

{
    "error": "InternalServerError", 
    "reason": "Link has expired. Request a new link by clicking \"Forgot your password?\" on the Login page.", 
    "exceptionCode": "-470"
}

1. #8274 Pending (Depend on Spanish translation)
2. #7545 Server's bug (Korey will fix it)
3. #8018 No solution

#8555
9,999,999,999.00

10,000,000,000.49



    Delete
    "assets\img\mobile-portrait-slide1-bg.jpg"
    "assets\img\mobile-portrait-slide2-bg.jpg"
    "assets\img\mobile-portrait-slide3-bg.jpg"
    "assets\img\mobile-portrait-slide4-bg.jpg"


    Add
    "assets\img\unpackage\mobile-portrait-slide1-bg.jpg"
    "assets\img\unpackage\mobile-portrait-slide2-bg.jpg"
    "assets\img\unpackage\mobile-portrait-slide3-bg.jpg"
    "assets\img\unpackage\mobile-portrait-slide4-bg.jpg"





1. Select Carrier: Actual: Seleccionar Compañía de Recargas Móviles, Expected: Seleccionar operador
4. Confirm Cell No. is required: Actual: Confirmacion Numero de celular obligatorio, Expected: Se requiere núm. de celular.



About point 11 (Row No. 452 in source file), The English text is "09 (Sep)".
The Spanish translation is "09 (Sept.)" in Spanish Mobile App, but It's "09 (Set.)" in Spanish - Website.
Please check it.


#8745

"refreshPersonalInfo" need to be invoked for refreshing data after native wrapper saved personal information successfully, referral APIs document (Self Service APIs_SL 5.4.doc).
We test the issue in Andriod device.
In Increase Sending Limit page, the API is not invoked after native wrapper saved personal information. 
So the data is not refreshed, Customer need to set multiple personal information.

Please check if "refreshPersonalInfo" is effective in this scenario. 


1.In moneytransfer add delivery option, There are some strings 'Send To Unidos Card' and 'Unidos Card'. do we need change to 'Send To Sengo Card' and 'Sengo Card'.


下班
做饭

衣服
小伙伴


MT 
Send money request failed The operation has timed out

BP LCR
We're Sorry. Something went wrong while connecting to Sengo. Please try again.

TP-Reload/TP-Pinless
Top Up transaction could not be completed. The operation has timed out

TP-ePin
Top Up failed
Top Up transaction could not be completed. The operation has timed out


   at Unidos.Client.SAL.RestProxyInterceptor.Intercept(IInvocation invocation) in 
   d:\UnidosTFSCode\Core\V1Code\POSv2\V1\Common\Unidos.Client.SAL\RestProxyInterceptor.cs:line 147
   at Castle.DynamicProxy.AbstractInvocation.Proceed()
   at Castle.Proxies.AbstractTopUpControllerProxy.PostSelfServiceTransaction(PosBillPaymentTransaction topUpTransaction)
   at Self.Service.Logics.TopUpLogic.SelfServicePayBill(PosBillPaymentTransaction topUpTransaction) in 
   d:\UnidosTFSCode\Core\V1Code\POSv2\V1\Self.Service\Logics\TopUpLogic.cs:line 237


using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

using Newtonsoft.Json;

using Unidos.Client.Common;
using Unidos.Client.Common.Models.Common;
using Unidos.Client.Interface;

namespace Self.Service.Filters
{
    public class SelfServiceExceptionHandlingAttribute : HandleErrorAttribute
    {
        private readonly ILoggerHelper _loggerHelper;
        private readonly IGlobalizationManager _globalizationManager;

        public SelfServiceExceptionHandlingAttribute(ILoggerHelper loggerHelper,
            IGlobalizationManager globalizationManager)
        {
            _loggerHelper = loggerHelper;
            _globalizationManager = globalizationManager;
        }

        public override void OnException(ExceptionContext filterContext)
        {
            _loggerHelper.LogException(filterContext.Exception.Message, filterContext.Exception);

            if (filterContext.HttpContext.Request.IsAjaxRequest())
            {
                filterContext.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

                var caption = _globalizationManager.GetString(LanguageResourceConstant.ErrorError);

                var serviceException = filterContext.Exception;

                if (serviceException.GetType() == typeof(NullReferenceException) ||
                    serviceException.GetType() == typeof(InvalidOperationException) ||
                     serviceException.GetType() == typeof(JsonReaderException) ||
                     serviceException.Message.StartsWith("<!DOCTYPE html>") ||
                     serviceException.Message.IndexOf(_globalizationManager.GetString(LanguageResourceConstant.System_Exception_Message)) > -1 ||
                     serviceException.Message.IndexOf(_globalizationManager.GetString(LanguageResourceConstant.Self_Service_System_Exception_Message)) > -1)
                {
                    var message = _globalizationManager.GetString(LanguageResourceConstant.Self_Service_System_Exception_Message);
                    filterContext.Result = new JsonResult { Data = new { Caption = caption, Message = message, Priority = 2, ReturnCode = -877 }, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                    filterContext.ExceptionHandled = true;
                    return;
                }
                else
                {
                    if (_globalizationManager.GetString(LanguageResourceConstant.System_Connection_Error).Equals(serviceException.Message) || _globalizationManager.GetString(LanguageResourceConstant.System_Opration_TimeOut).Equals(serviceException.Message) || Regex.IsMatch(serviceException.Message, "HTTP Error 404. The requested resource is not found.") || Regex.IsMatch(serviceException.Message, "The request failed with HTTP status 404: Not Found.")
                        || serviceException.Message.IndexOf("Client found response content type of 'text/html; charset=utf-8', but expected 'text/xml'") > -1)
                    {
                        var message = _globalizationManager.GetString(LanguageResourceConstant.System_Exception_Cannot_Connecting_To_Server);
                        filterContext.Result = new JsonResult { Data = new { Caption = caption, Message = message, Priority = 2, ReturnCode = -876 }, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                        filterContext.ExceptionHandled = true;
                        return;
                    }
                    else
                    {
                        try
                        {
                            var error = JsonConvert.DeserializeObject<WebExceptionModel>(serviceException.Message);
                            int returnCode = 0;
                            if (int.TryParse(error.ExceptionCode, out returnCode) && returnCode == -1001)
                            {
                                var message = _globalizationManager.GetString(LanguageResourceConstant.System_Exception_Cannot_Connecting_To_Server);
                                
                                filterContext.Result = new JsonResult { Data = new { Caption = caption, Message = message, Priority = 2 }, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                                filterContext.ExceptionHandled = true;
                                return;
                            }
                        }
                        catch (Exception)
                        {
                           // Do nothing
                        }

                        filterContext.Result = new JsonResult { Data = new { Caption = caption, Message = serviceException.Message, Priority = 2 }, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                        filterContext.ExceptionHandled = true;

                       // return;
                    }                 
                }          
            }
            else
            {
                filterContext.ExceptionHandled = true;
                RouteValueDictionary redirectTargetDictionary = new RouteValueDictionary();
                redirectTargetDictionary.Add("action", "Index");
                redirectTargetDictionary.Add("controller", "Home");
                redirectTargetDictionary.Add("system_exception", "unknown");

                filterContext.Result = new RedirectToRouteResult(redirectTargetDictionary);
            }
        }
    }
}


The operation has timed out

Error	160	A local variable named 'message' cannot be declared in this scope because it would give a different meaning to 'message', which is already used in a 'child' scope to denote something else	D:\UnidosTFSCode\Core\V1Code\POSv2\V1\Self.Service\Filters\SelfServiceExceptionHandlingAttribute.cs	85	29	Self.Service



$tempFile="pstips.txt"
$fs=New-Object System.IO.FileStream($tempFile,[System.IO.FileMode]::OpenOrCreate)
$fs.Seek(20MB,[System.IO.SeekOrigin]::Begin)
$fs.WriteByte(0)
$fs.Close()


-- API GetTransactionDetailByReceiptNumber

select * from send_money_transaction where receipt_number = 17032901100339701  order by date_created desc

select * from send_money_transaction_delivery where send_money_transaction_id = 63375

select * from pos_transaction_status_xref where transaction_status_code = 'F' and transaction_type_id = 14