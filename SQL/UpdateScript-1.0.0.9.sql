Use MoneyTransferCore;

if (select count(system_setting_key) from application_settings where system_setting_key = 'PeripheralService.Version') = 0 
    insert into application_settings values ('PeripheralService.Version','1.0.0.0','Latest version');

if (select count(system_setting_key) from application_settings where system_setting_key = 'PeripheralService.SetupURL') = 0 
    insert into application_settings values ('PeripheralService.SetupURL','http://qasupport.unidosfinancial.com/PeripheralsService/setup.exe','url of setup.exe');

if (select count(system_setting_key) from application_settings where system_setting_key = 'PeripheralService.UpdateURL') = 0 
    insert into application_settings values ('PeripheralService.UpdateURL','http://qasupport.unidosfinancial.com/PeripheralsService/setup.exe','url of update file');

UPDATE application_settings
SET system_setting_value = '1.0.0.9'
WHERE system_setting_key = 'PeripheralService.Version'

/*
update 
	application_settings 
set 
	system_setting_value = '1.0.0.2' 
where 
	system_setting_key = 'PeripheralService.Version'

select * from application_settings
*/