--remove permission
 declare @permission bigint
 set @permission=65544
 
 declare @state_name varchar(20)
 set @state_name='Texas'
 
 update business
 set client_options=client_options-@permission
 where self_service=1
 and client_options&@permission<>0
 and state_id in(
  select state_id from lu_states
  where state_name=@state_name
 )
 
 --add permission
 
 declare @permission bigint
 set @permission=65544
 
 declare @state_name varchar(20)
 set @state_name='District Of Columbia'
 
 
 update business
 set client_options=client_options+@permission
 where self_service=1
 and client_options&@permission=0
 and state_id in(
  select state_id from lu_states
  where state_name=@state_name
 )

/*
Permission:
MoneyTransfer:65544
BillPay:64576
BillPayLCR:4194304
Epin:1048576
Reload:  Domestic3160064 internation:2098176

*/