create or replace trigger late_fee_acc_3day_trg
before insert on rent_status for each row
declare accrual_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(last_accrual)) into accrual_length
FROM rent_status
where return_date IS Null
and last_accrual IS NOT Null
and mem_id =:new.mem_id

and rent_code = 'RC003';
 
update
member
set balance = balance +  ((accrual_length)* 2)
where mem_id=:new.mem_id;
update rent_status
set last_accrual = sysdate;
--- mem_id=:new.mem_id
end if;
end;
/
