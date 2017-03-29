use MoneyTransferCore
go
--1. update card_number
update card_dispenser set available=0
where card_number in
(
SELECT  cdi.card_number
FROM  
 chimp.dbo.carddata cd  
 inner join card c on c.card_number = cd.cardNumber  
inner join card_dispenser cdi on cdi.card_number = cd.cardNumber  and cdi.available=1
WHERE  
  c.card_status_code in ('0', '1', '2', '3') 
)
