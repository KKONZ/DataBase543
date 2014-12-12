create or replace trigger late_fee_acc_1day_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(last_accrual)) into rent_length
FROM rent_status
where return_date IS Null
and last_accrual IS NOT Null
and mem_id =:new.mem_id

and rent_code = 'RC001';
 
if (rent_length) > 1
then
update
member
set balance = balance +  ((rent_length -1 )* 2)
where mem_id=:new.mem_id;
update rent_status
set last_accrual = sysdate;
--- mem_id=:new.mem_id
end if;
end;
/