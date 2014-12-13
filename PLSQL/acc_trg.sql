create or replace trigger acc_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(last_accrual)) into rent_length
FROM rent_status
where return_date IS Null
and last_accrual IS NOT Null
and mem_id =:new.mem_id;
 
if (rent_length) > 0
then
update
member
set balance = balance +  (rent_length* 2)
where mem_id=:new.mem_id;
update rent_status
set last_accrual = sysdate
where mem_id=:new.mem_id;
end if;
end;
/
