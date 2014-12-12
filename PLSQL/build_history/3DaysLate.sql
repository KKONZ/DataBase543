create or replace trigger late_fee_new_3day_trg
before insert or update on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date)) into rent_length
FROM rent_status
where return_date IS Null
and mem_id =:new.mem_id
and rent_code = 'RC003'
and rent_date > trunc(sysdate - 3);

update
member
set balance = balance +  (rent_length * 2)
where mem_id=:new.mem_id;

end;
/
