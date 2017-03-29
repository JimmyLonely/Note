use MoneyTransferCore

begin tran
declare @first_name varchar(100)
declare @last_name varchar(100)
declare @mac_address varchar(100)
declare @employee_id bigint
select @employee_id=max(employee_id)+1 from employee

set @first_name='jimmy1'
set @last_name='li'
set @mac_address='C8:1F:66:0F:5E:C7'
print 'emplyee_id:'+Convert(varchar(50),@employee_id)

update business_equipment
set mac_address=mac_address+'1'
where mac_address=@mac_address

update employee
set username=username+'1'+CONVERT(varchar(12) , getdate(), 114 )
where username='augmentum\'+@first_name+'.'+@last_name

update employee
set username=username+'1'+CONVERT(varchar(12) , getdate(), 114 )
where username=@first_name

--print 'user_name:'+@first_name+' '+@last_name;
--print 'mac_address:'+@mac_address;
SET IDENTITY_INSERT employee ON
	Insert into employee(
				employee_id,
				employee_type_id,business_id,
				--manager_id,
				employee_status_code,
				date_created,last_updated,updated_by_id,created_by_id,created_by_device_id,updated_by_device_id,
				first_name,middle_name,last_name,
				address1,--address2,
				city,state_id,zipcode,country_id,
				--email_address,nick_name,ssn,
				username,password,
				--security_question_id,security_answer,home_phone_number,cell_phone_number,
				--work_phone_number,work_phone_number_extension,
				ofac_status_code,
				--ofac_false_positive_reason_id,
				aml_block,aml_watch,is_pos_admin,
				can_login
				--date_of_birth,id_type_id,id_number,nationality_country_id,id_state_id,id_expiration_date
			)
			values(
				@employee_id,
				11,1,
				'A',
				getdate(),getdate(),5,5,423,423,
				@first_name,'',@last_name,
				'address1 test',
				'city test',2,'zip code test',840,
				'augmentum\'+@first_name+'.'+@last_name,'9vNKkwxkVJi7a75lj8XZfIXJXpc=',
				'P',
				0,0,1,1			
			);


			Insert into employee(
				employee_id,
				employee_type_id,business_id,
				--manager_id,
				employee_status_code,
				date_created,last_updated,updated_by_id,created_by_id,created_by_device_id,updated_by_device_id,
				first_name,middle_name,last_name,
				address1,--address2,
				city,state_id,zipcode,country_id,
				--email_address,nick_name,ssn,
				username,password,
				--security_question_id,security_answer,home_phone_number,cell_phone_number,
				--work_phone_number,work_phone_number_extension,
				ofac_status_code,
				--ofac_false_positive_reason_id,
				aml_block,aml_watch,is_pos_admin,
				can_login
				--date_of_birth,id_type_id,id_number,nationality_country_id,id_state_id,id_expiration_date
			)
			values(
				@employee_id+1,
				11,35,
				'A',
				getdate(),getdate(),5,5,423,423,
				@first_name,'',@last_name,
				'address1 test',
				'city test',2,'zip code test',840,
				@first_name,'9vNKkwxkVJi7a75lj8XZfIXJXpc=',
				'P',
				0,0,1,1	
			);
			
SET IDENTITY_INSERT employee OFF
print 'insert employee successfully'

insert into business_equipment values(getdate(),getdate()+5000,264,264,323,323,1,1,@first_name+' PC','PC','hehe','YT00501',1,38.00,getdate(),2,@mac_address,35,38.00,38.00,getdate(),1,NULL,38.00,516,getdate(),'the notes',0,0,null,null,null);
insert into business_equipment values(getdate(),getdate()+5000,264,264,323,323,1,10,@first_name+' UI PC','PC','hehe','YT00501',1,38.00,getdate(),1,@mac_address,1,38.00,38.00,getdate(),1,NULL,38.00,510,getdate(),'the notes',0,0,null,null,null);
insert into business_equipment values(getdate(),getdate()+5000,264,264,323,323,1,11,@first_name+' PosServer PC','PC','hehe','YT00501',1,38.00,getdate(),1,@mac_address,1,38.00,38.00,getdate(),1,NULL,38.00,510,getdate(),'the notes',0,0,null,null,null);
print 'insert business_equipment successfully'

insert into employee_role_xref values(@employee_id,100,getdate(),getdate(),331,331,260,260);
insert into employee_role_xref values(@employee_id,103,getdate(),getdate(),331,331,260,260);
insert into employee_role_xref values(@employee_id,101,getdate(),getdate(),331,331,260,260);
insert into employee_role_xref values(@employee_id,104,getdate(),getdate(),331,331,260,260);
print 'insert employee role successfully'

If @@error <> 0
BEGIN
print 'run failed'
Rollback tran
END
ELSE
BEGIN
print 'run successfully'
commit tran
END
