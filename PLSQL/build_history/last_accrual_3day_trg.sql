create or replace trigger last_accrual_3day_trg
before insert or update on rent_status for each row
declare 
rent_length binary_Integer;
accrual_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date)) into rent_length
FROM rent_status
where return_date IS Null
and mem_id =:new.mem_id
and rent_code = 'RC003';
select sum(TRUNC(sysdate)-TRUNC(Last_accrual)) into accrual_length
FROM rent_status
where return_date IS Null
and mem_id =:new.mem_id
and rent_code = 'RC003';
  if last_accrual IS NOT NULL then
    update 
    member
    set balance = balance +((accrual_length-3)*2)
    where mem_id=:new.mem_id;
    
    update
    rent_status
    set last_accrual = sysdate
    where mem_id=:new.mem_id;
 elsif (rent_length) >3 then
    update
    member
    set balance = balance +  ((rent_length-3) * 2)
    where mem_id=:new.mem_id;
    
    update
    rent_status
    set last_accrual = sysdate
    where mem_id=:new.mem_id;
  else
dbms_output.put_line('no new 3 day rental charges');
end if;
end;
/
show errors
