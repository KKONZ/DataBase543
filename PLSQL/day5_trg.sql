create or replace trigger 5day_trg
before insert or update on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date)) into rent_length
FROM rent_status
where return_date IS Null
and mem_id =:new.mem_id
and last_accrual IS Null
and rent_date > trunc(sysdate-5)
and rent_code = 'RC005';

update
member
set balance = balance +  ((rent_length -5)* 2)
where mem_id=:new.mem_id;
update
Rent_Status
set last_accrual = sysdate
where mem_id=:new.mem_id;
end;
/
